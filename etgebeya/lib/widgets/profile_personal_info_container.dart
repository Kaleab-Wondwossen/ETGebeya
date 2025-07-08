import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';


class PersonalInfoContainer extends StatefulWidget {
   final String fullName;
  final String email;

  const PersonalInfoContainer({
    super.key,
    required this.fullName,
    required this.email,
  });

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
                '   Full Name      ',
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: AppSizes.mediumGap * 3),
              Text(
                widget.fullName,
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
               widget.email,
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
