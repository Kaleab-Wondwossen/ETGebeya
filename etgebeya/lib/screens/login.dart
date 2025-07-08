import 'dart:convert';

import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_box.dart';
import 'SignUp/sign_up_with_google.dart';

class LogIn extends StatefulWidget {
  final void Function()? ontap;
  const LogIn({super.key, this.ontap});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future<void> _handleLogin() async {
    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and password cannot be empty")),
      );
      return;
    }

    final res = await ApiService.post('/auth/login', {
      'username': email,
      'password': password,
    });

    print('Status: ${res.statusCode}');
    print('Body: ${res.body}');

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);

      // ✅ Check if token exists
      final token = data['accessToken'];
      if (token is String && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        Navigator.pop(context); // Go back to guarded screen
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No token received from server')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  height: AppSizes.largeGap * 11.55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(247, 247, 247, 1),
                  ),
                  child: Image.asset("images/logomain.png")),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              Text(
                "Login",
                style: GoogleFonts.acme(
                    fontSize: AppSizes.primaryFontSize * 1.2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryIconColor),
              ),
              SizedBox(
                height: AppSizes.smallGap * .5,
              ),
              Text(
                "Discover items Near you with cheap prices",
                style: GoogleFonts.acme(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: const Color.fromARGB(255, 102, 102, 102),
                ),
              ),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              MyTextBox(
                hintText: "Enter Your Email Address",
                icon: const Icon(Icons.email),
                controller: emailcontroller,
              ),
              MyTextBox(
                hintText: "Enter Your Password",
                icon: const Icon(Icons.lock),
                optionalIcon: const Icon(Icons.password),
                controller: passwordcontroller,
                obscureText: true,
              ),
              SizedBox(
                height: AppSizes.smallGap * 2.5,
              ),
              GestureDetector(
                onTap: _handleLogin,
                child: MyBytton(
                    height: AppSizes.largeGap * 1.5,
                    width: AppSizes.largeGap * 9.5,
                    btnName: "Login"),
              ),
              SizedBox(
                height: AppSizes.smallGap * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.acme(
                      fontSize: AppSizes.tertiaryFontSize,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.smallGap * .5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const SignUpWithGoogle(),
                          transitionDuration:
                              Duration.zero, // No transition duration
                          reverseTransitionDuration:
                              Duration.zero, // No reverse transition duration
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.acme(
                            fontSize: AppSizes.tertiaryFontSize,
                            color: AppColors.primaryIconColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
