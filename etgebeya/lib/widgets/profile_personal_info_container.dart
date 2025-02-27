import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';


class PersonalInfoContainer extends StatefulWidget {
  const PersonalInfoContainer({super.key});

  @override
  State<PersonalInfoContainer> createState() => _PersonalInfoContainerState();
}

class _PersonalInfoContainerState extends State<PersonalInfoContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.mediumGap * 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.mediumGap)),
        color: const Color.fromRGBO(232, 232, 232, 1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: AppSizes.smallGap,
          ),
          Row(
            children: [
              SizedBox(
                width: AppSizes.smallGap,
              ),
              const Icon(
                Icons.mobile_friendly,
                color:  AppColors.primaryIconColor,
              ),
              Text(
                '   Phone Number',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: AppSizes.mediumGap * 3),
              Text(
                '+251 912 456 666',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: AppSizes.smallGap * .25,
            color: Colors.white,
          ),
          Row(
            children: [
              SizedBox(
                width: AppSizes.smallGap,
              ),
              const Icon(
                Icons.email,
                color:  AppColors.primaryIconColor,
              ),
              Text(
                '   Email',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: AppSizes.mediumGap * 5.5),
              Text(
                "email@gmail.com",
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: AppSizes.smallGap * .25,
            color: Colors.white,
          ),
          Row(
            children: [
              SizedBox(
                width: AppSizes.smallGap,
              ),
              const Icon(
                Icons.password,
                color:  AppColors.primaryIconColor,
              ),
              Text(
                '   Change Password',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: AppSizes.mediumGap * 5),
              Text(
                '*********',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            thickness: AppSizes.smallGap * .25,
            color: Colors.white,
          ),
          Row(
            children: [
              SizedBox(
                width: AppSizes.smallGap,
              ),
              const Icon(
                Icons.email,
                color:  AppColors.primaryIconColor,
              ),
              Text(
                '   My Teams',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: AppSizes.mediumGap * 10),
              Text(
                '>',
                style: TextStyle(
                    fontSize: AppSizes.tertiaryFontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
