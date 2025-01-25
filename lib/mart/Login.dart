import 'package:flutter/material.dart';
import 'package:ufuqstore/core/AppTheme.dart';

import 'package:ufuqstore/features/Product/presintation/page/productsPage.dart';

//import '../features/ProductDeatils/presintation/page/ProductPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purple.withOpacity(0.1),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 50,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: Column(
                  children: [
                    Text(
                      "مرحباً بكم في متجرنا",
                      style: AppTheme.textTheme.displayLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "يرجى تسجيل الدخول للمتابعة",
                      style: AppTheme.textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "عنوان البريد الإلكتروني",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.email, color: AppTheme.backgroundColor),
                        labelStyle: AppTheme.textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 213, 144, 225),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),

                    TextField(
                      decoration: InputDecoration(
                        labelText: "كلمة المرور",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.lock, color: AppTheme.backgroundColor),
                        labelStyle: AppTheme.textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 213, 144, 225),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppTheme.backgroundColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                        ),
                      ),
                      obscureText: _isPasswordHidden,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: AppTheme.textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: AppTheme.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "تسجيل الدخول",
                    style: AppTheme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب؟",
                    style: AppTheme.textTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      fontWeight:FontWeight.bold,
                    )

                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text(
                      "سجّل الآن",
                      style: AppTheme.textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
