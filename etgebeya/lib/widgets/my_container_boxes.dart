import 'package:flutter/material.dart';

import '../measures/size_consts.dart';


class MyContainer extends StatefulWidget {
  final String? name;
  final String? path;
  const MyContainer({super.key, this.name, this.path});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.largeGap, AppSizes.smallGap * .5,
          AppSizes.largeGap, AppSizes.smallGap * .5),
      child: Container(
        height: AppSizes.largeGap * 1.5,
        width: AppSizes.largeGap*10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.smallGap),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.path ?? "images/google_icon.png", height: AppSizes.smallGap*3,),
            SizedBox(width: AppSizes.smallGap),
            Text(
              widget.name ?? "Sign Up with Google",
              style: TextStyle(
                fontSize: AppSizes.tertiaryFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
