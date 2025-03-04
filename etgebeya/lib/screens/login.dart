import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/screens/post_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

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
                  height: AppSizes.largeGap * 12,
                  width: AppSizes.largeGap * 14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(247, 247, 247, 1),
                  ),
                  child: Image.asset("images/logo.png")),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              Text(
                "Login",
                style: GoogleFonts.acme(
                  fontSize: AppSizes.primaryFontSize * 1.2,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 26, 46, 107),
                ),
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
                onTap: (){},
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //       pageBuilder: (context, animation1, animation2) =>
                //           const HomeScreen(),
                //       transitionDuration:
                //           Duration.zero, // No transition duration
                //       reverseTransitionDuration:
                //           Duration.zero, // No reverse transition duration
                //     ),
                //   );
                // },
                child: GestureDetector(
                  onTap: (){
                     Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const PostItems(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
                  },
                  child: MyBytton(
                      height: AppSizes.largeGap * 1.5,
                      width: AppSizes.largeGap * 9.5,
                      btnName: "Login"),
                ),
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
                  transitionDuration: Duration.zero, // No transition duration
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
                            color: const Color.fromRGBO(26, 46, 107, 1),
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
