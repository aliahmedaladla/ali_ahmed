
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ufuqstore/core/util/ScreenUtil.dart';

import '../../../../injection_container.dart';
import '../../../../main.dart';

import '../manager/ProductDeatils_bloc.dart';

class ProductDeatilsPage extends StatefulWidget {
  ProductDeatilsPage({super.key});

  @override
  State<ProductDeatilsPage> createState() => ProductDeatilsPageState();
}

class ProductDeatilsPageState extends State<ProductDeatilsPage> {
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
  Widget ProductDeatilsWidget = Container();
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
                  .add(GetAllProductDeatils(id: "1"));
            }

            if (state is ProductDeatilsLoading) {
              ProductDeatilsWidget = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenUtil.screenHeight * .1,
                  ),
                  Center(
                      child: Text("loding ......."))


                ],
              );
            }

            if (state is ProductDeatilsILoaded) {
              //TODO::Show ProductDeatils here




              return Column(
                children: [
                  Image.network(state.productDeatilsModel[0].image,fit: BoxFit.cover,)
                ],

              );
            }

            return ProductDeatilsWidget;
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
