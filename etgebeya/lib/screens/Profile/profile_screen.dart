import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:etgebeya/screens/home_page.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../measures/size_consts.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/nav_bar.dart';
import '../../widgets/profile_personal_info_container.dart';
import '../../widgets/profile_utilities_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username;
  String? activeSince;
  String? fullName;
  String? email;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      // ⬇️ Print token and headers for debugging
      final token = await SharedPreferences.getInstance()
          .then((prefs) => prefs.getString('token'));
      print("Token: $token");

      final response = await http.get(
        Uri.parse('http://kelalgebeya.com:8080/user/me'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          username = data['username']; // or whatever field you expect
          fullName = data['fullName']; // ✅
          email = data['email']; // ✅
          activeSince = formatDate(data['modifiedDate']); // your formatter
          isLoading = false;
        });
      } else {
        print('Failed to fetch user data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  String formatDate(String isoDate) {
    final date = DateTime.tryParse(isoDate);
    if (date != null) {
      return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    }
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const MyAppBar(), 
                SizedBox(height: AppSizes.smallGap),
                CircleAvatar(
                  radius: AppSizes.mediumGap * 2.5,
                  backgroundImage: const AssetImage('images/pp.jpeg'),
                ),
                SizedBox(height: AppSizes.smallGap),
                Text(
                  isLoading ? 'Loading...' : username ?? 'User',
                  style: TextStyle(
                    fontSize: AppSizes.primaryFontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                Text(
                  isLoading ? '' : "Active Since: $activeSince",
                  style: TextStyle(
                    fontSize: AppSizes.tertiaryFontSize,
                    color: Theme.of(context).textTheme.bodySmall!.color,
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
                  child: PersonalInfoContainer(
                      fullName:  isLoading ? 'Loading...' : fullName ?? 'User', email:  isLoading ? 'Loading...' : email ?? 'User'),
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
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('token'); // ✅ Remove token

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false, // ✅ Clear navigation stack
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged out successfully'),
                        backgroundColor: AppColors
                            .primaryIconColor, // 🔴 Set your custom color here
                        behavior: SnackBarBehavior
                            .floating, // optional: makes it float
                        duration: Duration(seconds: 2),
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
      bottomNavigationBar: const MyNavBar(index: 3),
    );
  }
}
