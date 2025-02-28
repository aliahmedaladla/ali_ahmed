import 'package:flutter/material.dart';
import 'package:ufuqstore/core/util/common.dart';
import 'package:ufuqstore/features/Home/presintation/page/homePage.dart';
import 'package:ufuqstore/features/Product/presintation/page/productsPage.dart';
import 'package:ufuqstore/features/Registration/presintation/manager/Registration_bloc.dart';
import 'package:ufuqstore/features/Registration/presintation/page/LoginPage.dart';
import 'package:ufuqstore/features/Registration/presintation/page/SignupPage.dart';
import 'injection_container.dart' as object;
late final String token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await object.init();
  token = await getCachedData(key: "token", retrievedDataType: "", returnType: "")??"";
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: token == "" ? SinupPage() : Product(),
    );
  }
}
