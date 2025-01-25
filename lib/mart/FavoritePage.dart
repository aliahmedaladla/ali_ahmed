import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // بيانات المفضلة يتم تمريرها عبر arguments عند الانتقال
    final List<Map<String, String>> favorites =
    ModalRoute.of(context)!.settings.arguments as List<Map<String, String>>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: favorites.isEmpty
          ? Center(
        child: Text(
          'No favorites yet!',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final product = favorites[index];
          return ListTile(
            leading: Icon(Icons.add, color: Colors.green), // أيقونة "+"
            title: Text(product['name']!),
            subtitle: Text(product['price']!),
          );
        },
      ),
    );
  }
}
