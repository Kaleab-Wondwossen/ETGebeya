import 'package:etgebeya/screens/login.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../measures/size_consts.dart';
import '../../widgets/nav_bar.dart';
import '../../widgets/profile_personal_info_container.dart';
import '../../widgets/profile_utilities_container.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "ETGebeya",
          style: TextStyle(
            fontSize: AppSizes.primaryFontSize,
            fontWeight: FontWeight.bold,
            color:  AppColors.primaryTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: AppSizes.smallGap),
                CircleAvatar(
                  radius: AppSizes.mediumGap * 2.5,
                  backgroundImage: const AssetImage('images/pp.jpeg'),
                ),
                SizedBox(height: AppSizes.smallGap),
                Text(
                  "User",
                  style: TextStyle(
                    fontSize: AppSizes.primaryFontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color, // Use theme color
                  ),
                ),
                Text(
                  "Active Since : Aug 21 2013",
                  style: TextStyle(
                    fontSize: AppSizes.tertiaryFontSize,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color, // Use theme color
                  ),
                ),
                SizedBox(height: AppSizes.mediumGap),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppSizes.mediumGap, 0, AppSizes.smallGap, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Information",
                        style: TextStyle(
                          fontSize: AppSizes.secondaryFontSize * .85,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color, // Use theme color
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            AppSizes.largeGap * 3.6, 0, 0, 0),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: AppSizes.tertiaryFontSize,
                            color: AppColors.secondaryText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.secondaryIconColor,
                        ),
                        iconSize: AppSizes.smallIconSize,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSizes.mediumGap),
                  child: const PersonalInfoContainer(),
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, 0, AppSizes.mediumGap * 13, 0),
                  child: Text(
                    "Utilities",
                    style: TextStyle(
                      fontSize: AppSizes.secondaryFontSize * .85,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color, // Use theme color
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSizes.mediumGap),
                  child: const UtilitiesContainer(),
                ),
                GestureDetector(
                  onTap: (){
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
                  child: Container(
                    height: AppSizes.mediumGap * 2.5,
                    width: AppSizes.largeGap * 10,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppSizes.smallGap)),
                      color: const Color.fromRGBO(232, 232, 232, 1),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: AppSizes.mediumGap),
                        Icon(
                          Icons.logout,
                          size: AppSizes.mediumIconSize,
                          color: Colors.red,
                        ),
                        SizedBox(width: AppSizes.smallGap),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.secondaryFontSize,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyNavBar(index: 4),
    );
  }
}
