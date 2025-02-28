import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ufuqstore/core/util/ScreenUtil.dart';
import 'package:ufuqstore/injection_container.dart';
import '../../../Product/presintation/Widget/ProductCard.dart';
import '../manager/Home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 **السلايدر (Carousel)**
            Padding(
              padding: const EdgeInsets.only(top: 40.0), // رفع السلايدر قليلاً من الأعلى
              child: BlocProvider(
                create: (context) => sl<Home_bloc>()..add(carouselEvent()),
                child: BlocConsumer<Home_bloc, HomeState>(
                  listener: (context, state) {
                    if (state is carouselError) {
                      print(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is carouselLoading) {
                      return Center(child: Lottie.asset('assets/Json/Loding.json'));
                    }

                    if (state is carouselLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: 220.0, // زيادة ارتفاع السلايدر ليبدو أفضل
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds:4 ),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.easeInOut,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.85,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          scrollPhysics: BouncingScrollPhysics(),
                        ),
                        items: state.carouselModel.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10), // جعل الصور منخفضة قليلًا
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25), // حواف ناعمة وجميلة
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4), // ظل جذاب
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                      offset: Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25), // زوايا منحنية للصورة
                                  child: Stack(
                                    children: [

                                      Positioned.fill(
                                        child: Image.network(
                                          i.image ?? "https://via.placeholder.com/400",
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      /// 🔹 **إضافة تأثير ظل زجاجي خفيف في الأسفل**

                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      );
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),






            /// 🔹 **الأقسام (Categories)**
            BlocProvider(
              create: (context) => sl<Home_bloc>()..add(categoriesEvent()),
              child: BlocConsumer<Home_bloc, HomeState>(
                listener: (context, state) {
                  if (state is categoriesError) {
                    print(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state is categoriesLoading) {
                    return Center(child: Lottie.asset('assets/Json/Loding.json'));
                  }

                  if (state is categoriesLoaded) {
                    // تحقق من البيانات
                    print("Categories Data: ${state.categoriesModel}");

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Categories",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.categoriesModel.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final category = state.categoriesModel[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        category.image ?? "https://via.placeholder.com/60",
                                      ),
                                    ),
                                    SizedBox(height: 5), // مسافة بين الصورة والنص
                                    Text(
                                      state.categoriesModel[index].name, // استخدام قيمة افتراضية إذا كان الاسم null
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox();
                },
              ),
            ),

            /// 🔹 **المنتجات المميزة (Featured Products)**
            BlocProvider(
              create: (context) => sl<Home_bloc>()..add(featuredProductsEvent()),
              child: BlocConsumer<Home_bloc, HomeState>(
                listener: (context, state) {
                  if (state is featuredProductsError) {
                    print(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state is featuredProductsLoading) {
                    return Center(child: Lottie.asset('assets/Json/Loding.json'));
                  }

                  if (state is featuredProductsLoaded) {
                    return SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.productModel.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 5,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  state.productModel[index].image ?? "https://via.placeholder.com/120",
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 120,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
