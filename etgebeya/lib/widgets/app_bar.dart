import 'package:etgebeya/utils/colors.dart';
import 'package:etgebeya/widgets/dynamic_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../measures/size_consts.dart';

// Placeholder imports (replace with your actual ones)
// import 'package:etgebeya/measures/size_consts.dart';
// import 'package:etgebeya/utils/colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(AppSizes.smallGap, 0, 0, 0),
            child: SvgPicture.asset(
              'images/logoW.svg',
              width: AppSizes.smallGap * 1.5,
              height: AppSizes.smallGap * 2.5,
            ),
          ),
        ),
        SizedBox(
          width: AppSizes.largeGap * 4.7,
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: AppColors.primaryIconColor, // Replace AppColors.primaryIconColor
              ),
              onPressed: () {
                // Handle favorite action
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_active,
                color: AppColors.primaryIconColor, // Replace AppColors.primaryIconColor
              ),
              onPressed: () {
                 Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const DynamicFormScreen(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
              },
            ),
          ],
        ),
      ],
    );
  }
}