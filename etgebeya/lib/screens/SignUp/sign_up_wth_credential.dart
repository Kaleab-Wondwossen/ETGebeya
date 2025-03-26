import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../measures/size_consts.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_box.dart';
import '../login.dart';

class SignUpWithCredential extends StatefulWidget {
  final void Function()? ontap;
  const SignUpWithCredential({super.key, this.ontap});

  @override
  State<SignUpWithCredential> createState() => _SignUpWithCredentialState();
}

class _SignUpWithCredentialState extends State<SignUpWithCredential> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmPassword = TextEditingController();

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
                width: AppSizes.largeGap * 14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(247, 247, 247, 1),
                ),
                child: Image.asset("images/logomain.png"),
              ),
              SizedBox(height: AppSizes.smallGap),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up for",
                    style: GoogleFonts.ptSerif(
                      fontSize: AppSizes.primaryFontSize * 1.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: AppSizes.smallGap * 1),
                  Text(
                    "KelalGebeya",
                    style: GoogleFonts.newRocker(
                      fontSize: AppSizes.primaryFontSize * 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryIconColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.smallGap * .5),
              Text(
                "Discover Items Near you with cheap prices",
                style: GoogleFonts.acme(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: const Color.fromARGB(255, 102, 102, 102),
                ),
              ),
              SizedBox(height: AppSizes.smallGap),
              MyTextBox(
                hintText: "Enter Your Email",
                icon: const Icon(Icons.email),
                controller: emailcontroller,
              ),
              MyTextBox(
                hintText: "Enter Password",
                icon: const Icon(Icons.lock),
                optionalIcon: const Icon(Icons.password),
                controller: passwordcontroller,
                obscureText: true,
              ),
              MyTextBox(
                hintText: "Confirm Password",
                icon: const Icon(Icons.lock),
                optionalIcon: const Icon(Icons.password),
                controller: confirmPassword,
                obscureText: true,
              ),
              SizedBox(height: AppSizes.smallGap * 2),
              GestureDetector(
                onTap: () {
                  // Handle sign-up
                },
                child: MyBytton(
                  height: AppSizes.largeGap * 1.5,
                  width: AppSizes.largeGap * 9.5,
                  btnName: "Sign Up",
                ),
              ),
              SizedBox(height: AppSizes.smallGap * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.acme(
                      fontSize: AppSizes.tertiaryFontSize,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: AppSizes.smallGap * .5),
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const LogIn(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.acme(
                        fontSize: AppSizes.tertiaryFontSize,
                        color: AppColors.primaryIconColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.smallGap * 1.5),
            ],
          ),
        ),
      ),
    );
  }
}