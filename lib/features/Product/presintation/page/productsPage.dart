import 'package:flutter/material.dart';
import 'package:ufuqstore/Widget/WidgetProduct.dart';
//import 'package:ufuqstore/features/ProductDeatilsModel/data/repository/ProductDeatilsModelRepository.dart';
import 'package:ufuqstore/core/AppTheme.dart';



class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, String>> products = [
    {"name": "Watch", "price": "\$40", "image": "assets/Images/img_1.png"},
    {"name": "Nike", "price": "\$430", "image": "assets/Images/img_2.png"},
    {"name": "LG TV", "price": "\$330", "image": "assets/Images/img_3.png"},
    {"name": "Airpods", "price": "\$333", "image": "assets/Images/img_4.png"},
    {"name": "Jacket", "price": "\$50", "image": "assets/Images/img_5.png"},
    {"name": "Jacket", "price": "\$50", "image": "assets/Images/img_6.png"},
    {"name": "Jacket", "price": "\$50", "image": "assets/Images/img_7.png"},
    {"name": "Jacket", "price": "\$50", "image": "assets/Images/img_8.png"},
  ];

  List<Map<String, String>> favorites = [];

  void toggleFavorite(Map<String, String> product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor, // استخدام اللون الأساسي
        elevation: 0,
        title: Text(
          'Products',
          style: AppTheme.textTheme.titleLarge, // استخدام الخط والستايل
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/Favorite_page',
                arguments: favorites,
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: AppTheme.secondaryColor), // لون الأيقونات
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isFavorite = favorites.contains(product);

          return ContainerProduct(
            product: product,
            isFavorite: isFavorite,
            onFavoriteToggle: () => toggleFavorite(product),
          );
        },
      ),
      backgroundColor: AppTheme.scaffoldBackgroundColor, // خلفية الشاشة
    );
  }
}
