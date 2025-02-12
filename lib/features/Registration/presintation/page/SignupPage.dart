import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ufuqstore/core/util/common.dart';
import 'package:ufuqstore/features/Product/presintation/page/productsPage.dart';


import '../../../../core/util/ScreenUtil.dart';
import '../../../../injection_container.dart';
import '../manager/Registration_bloc.dart';

class SinupPage extends StatefulWidget {
  @override
  State<SinupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SinupPage> {
  @override
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();

  int itemisselected = 0;
  String valueInput = "";
  Widget ProductWidget = Container();
  ScreenUtil screenUtil = ScreenUtil();


  final TextEditingController _usrnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول"),),
      body: BlocProvider(
        create: (context) => sl<Registration_bloc>(),
        child: BlocConsumer<Registration_bloc, RegistrationState>(
          listener: (context, state) {
    if (state is SinupError) {
    print(state.errorMessage);
    }


    if (state is SinupLoading){

    AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    animType: AnimType.rightSlide,
    title: 'تسجيل الدخول',
    desc: 'انقر OK للمتابعة',
    btnCancelOnPress: () {

    print('تم الضغط على إلغاء');
    },
    btnOkOnPress: () {

    print('تم الضغط على موافق');
    },
    )..show();
    }

    if (state is SinupLoaded){
    AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'تم تسجيل الدخول بنجاح',
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Icon(Icons.check_circle, color: Colors.green, size: 50),
    SizedBox(height: 16),
    Text(
    "${state.registrationModel.message}",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    )
    ],
    ),
    )
    )..show();
    cachedData(key: "token", data: state.registrationModel.token);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));
    }
    },
          builder: (context, state) {

            return
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usrnameController,
                      decoration: InputDecoration(
                        labelText: "اسم المستخدم",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "البريد الإلكتروني",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "كلمة المرور",
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of < Registration_bloc>(context).add(SinupEvent( username: _usrnameController.text, email: _emailController.text, password: _passwordController.text));

                      },
                      child: Text("تسجيل الدخول"),
                    ),
                  ],
                ),
              );
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