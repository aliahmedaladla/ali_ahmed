import 'package:flutter/material.dart';
import 'package:ufuqstore/core/AppTheme.dart';

class Productcard extends StatelessWidget {
  final name;
  final price;
  final reviews;
  final image;

  const Productcard(
      {super.key,
      required this.name,
      required this.price,
      required this.reviews,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.primaryColor, width: 5)),
      child: Column(
        children: [
          Image.network(image),
          Text(name),
          Text(price),
          Text(reviews)
        ],
      ),
    );
  }
}
