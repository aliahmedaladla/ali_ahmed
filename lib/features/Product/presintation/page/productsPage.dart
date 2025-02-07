import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ufuqstore/core/AppTheme.dart';
import 'package:ufuqstore/core/util/ScreenUtil.dart';
import 'package:ufuqstore/features/Product/presintation/Widget/ProductCard.dart';

import '../../../../injection_container.dart';
import '../manager/Product_bloc.dart';

class Product extends StatefulWidget {
  Product({super.key});

  @override
  State<Product> createState() => _ProductPageState();
}

class _ProductPageState extends State<Product> {
  List filterList = [];

  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int itemisselected = 0;
  String valueInput = "";
  Widget ProductWidget = Container();
  ScreenUtil screenUtil = ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.deepOrange,
        elevation: 100,
        title: Text(
          'Product',
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<Product_bloc>(),
        child: BlocConsumer<Product_bloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              print(state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ProductInitial) {
              BlocProvider.of<Product_bloc>(context).add(GetAllProduct());
            }

            if (state is ProductLoading) {
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

            if (state is ProductILoaded) {
              //TODO::Show Product here

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: state.productModel.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      productModel: state.productModel[index],
                    );
                  });
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
