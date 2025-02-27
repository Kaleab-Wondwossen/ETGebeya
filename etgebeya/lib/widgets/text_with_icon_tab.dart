import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TextWithIcon extends StatelessWidget {
  final String text; // Required text
  final IconData icon; // Required icon

  // Constructor with required parameters
  TextWithIcon({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.smallGap*1.5,0,AppSizes.smallGap,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(
            fontSize: AppSizes.secondaryFontSize,
            fontWeight: FontWeight.bold,
          ),), // Use the provided text
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              width: AppSizes.largeGap*3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.smallGap*.5),
                border: Border.all()
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Filter", style: TextStyle(
                  color: AppColors.secondaryText,
                ),),
                SizedBox(
                  width: AppSizes.smallGap,
                ),
                Icon(icon, color: AppColors.secondaryIconColor,),
              ],
            )),
          ), // Use the provided icon
        ],
      ),
    );
  }
}