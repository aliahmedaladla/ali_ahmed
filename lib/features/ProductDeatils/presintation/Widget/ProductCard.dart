import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:ufuqstore/core/AppTheme.dart';
import 'package:ufuqstore/features/ProductDeatils/presintation/page/ProductDeatilsPage.dart';
class Productcard extends StatelessWidget {
  final name;
  final  price;
  final reviews;
  final image;

  const Productcard({super.key,required this.name,required this.price,required this.reviews,required this.image});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDeatilsPage() ));   


      },
    child:   Container(
      decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryColor,width: 5)),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(image,fit: BoxFit.cover,),
            ),
            Image.network(image),
            Text(name),
            Text(price),
            Text(reviews),
            Icon(Icons.add,size: 20,)
          ],
        ),
    ),
    );
  }
}
