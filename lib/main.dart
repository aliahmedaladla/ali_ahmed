import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ufuqstore/mart/FavoritePage.dart';

import 'features/ProductDeatils/presintation/page/ProductDeatilsPage.dart';
import 'mart/Login.dart'; // تأكد من أن المسار صحيح لملف Login.dart
import 'injection_container.dart' as object;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await object.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        // تسجيل المسار لصفحة المفضلة
        '/ProductDeatilsPage': (context) => ProductDeatilsPage(),
      },
      home: LoginPage(),
    );
  }
}
