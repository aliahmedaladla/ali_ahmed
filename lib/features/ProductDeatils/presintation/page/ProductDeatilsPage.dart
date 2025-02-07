import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ufuqstore/core/util/ScreenUtil.dart';

import '../../../../injection_container.dart';
import '../manager/ProductDeatils_bloc.dart';

class ProductDeatilsPage extends StatefulWidget {
  final String id;
  ProductDeatilsPage({super.key, required this.id});

  @override
  State<ProductDeatilsPage> createState() => _ProductDeatilsPageState();
}

class _ProductDeatilsPageState extends State<ProductDeatilsPage> {
  @override
  ScrollController _scrollController = ScrollController();
  List filterList = [
    {
      "name": "الدول  المناصرة للقضية",
      "id": 4,
    },
    {
      "name": "الدول  الداعمة للقضية",
      "id": 3,
    },
    {
      "name": "الدول الداعمة للاحتلال",
      "id": 2,
    },
    {
      "name": "الدول المحايدة",
      "id": 1,
    },
  ];

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int itemisselected = 0;
  String valueInput = "";
  Widget ProductWidget = Container();
  ScreenUtil screenUtil = ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<ProductDeatils_bloc>(),
        child: BlocConsumer<ProductDeatils_bloc, ProductDeatilsState>(
          listener: (context, state) {
            if (state is ProductDeatilsError) {
              print(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ProductDeatilsInitial) {
              BlocProvider.of<ProductDeatils_bloc>(context)
                  .add(GetAllProductDeatils(id: widget.id));
            }

            if (state is ProductDeatilsLoading) {
              ProductWidget = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenUtil.screenHeight * .1,
                  ),
                  Center(child: Lottie.asset('assets/Json/Loding.json'))
                ],
              );
            }

            if (state is ProductDeatilsILoaded) {
              //TODO::Show Product here

              return Column(
                children: [
                  SizedBox(
                    height: screenUtil.screenHeight * .5,
                    child: Image.network(
                      state.productDeatilsModel.image,
                    ),
                  ),
                  Text(state.productDeatilsModel.name),
                  Text(state.productDeatilsModel.price.toString()),
                  Text(state.productDeatilsModel.reviews.toString()),
                ],
              );
            }

            return ProductWidget;
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
}
