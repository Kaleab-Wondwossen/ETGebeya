import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('images/logo.png', width: AppSizes.smallGap*1.5, height: AppSizes.smallGap*2.5,)),
        SizedBox(
          width: AppSizes.largeGap*5.5,
        ),
        Row(
          children: [
            IconButton(
            icon: const Icon(Icons.favorite_border_outlined, color: AppColors.primaryIconColor),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active, color: AppColors.primaryIconColor,),
            onPressed: () {
              // Handle search action
            },
          ),
          ],
        )
      ],
    );
  }
}