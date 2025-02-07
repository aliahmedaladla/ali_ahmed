import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end, // محاذاة العناصر لليمين
            children: [
              const Text(
                "مرحبا بكم",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                " يرجى تسجيل الدخول للمتابعة ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              Directionality(
                textDirection: TextDirection.rtl, // تغيير اتجاه النص
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: " عنوان البريد الألكتروني ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email), // الأيقونة على اليمين
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Directionality(
                textDirection: TextDirection.rtl, // تغيير اتجاه النص
                child: TextField(
                  decoration: InputDecoration(
                    labelText: " كلمة المرور ",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock), // الأيقونة على اليمين
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
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
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft, // محاذاة النص لليسار
                child: TextButton(
                  onPressed: () {
                    // Navigate to forgot password page
                  },
                  child: const Text(
                    " هل نسيت كلمة السر ؟",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform login action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(" تسجيل الدخول "),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" ليس لديك حساب؟ "),
                  TextButton(
                    onPressed: () {
                      // Navigate to sign-up page
                    },
                    child: const Text(
                      " سجّل الآن ",
                      style: TextStyle(color: Colors.blue),
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
