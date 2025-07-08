import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/screens/login.dart';
import 'package:etgebeya/screens/services.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:etgebeya/widgets/language_pop_up.dart';
import 'package:flutter/material.dart';

import '../screens/Profile/profile_screen.dart';
import '../screens/home_page.dart';
import '../screens/post_screen.dart';
import '../utils/auth_guard.dart';

class MyNavBar extends StatefulWidget {
  final int index;
  final Function(int)? onIndexChanged;

  const MyNavBar({super.key, required this.index, this.onIndexChanged});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: widget.index,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor:
          AppColors.primaryIconColor, // Color for selected icon and label
      unselectedItemColor:
          AppColors.secondaryIconColor, // Color for unselected icon and label
      selectedLabelStyle: TextStyle(
        color: AppColors.primaryIconColor, // Color for selected label
        fontSize: AppSizes.tertiaryFontSize, // Font size for selected label
        fontWeight: FontWeight.bold, // Font weight for selected label
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.secondaryIconColor, // Color for unselected label
        fontSize: AppSizes.tertiaryFontSize, // Font size for unselected label
      ),
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded), label: 'Home', tooltip: "Home"),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.explore),
        //   label: 'Explore',
        //   tooltip: "Discover"
        // ),
        BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Services',
            tooltip: "Services"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), label: 'post', tooltip: "Post"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile', tooltip: "Profile"),
        BottomNavigationBarItem(
            icon: Icon(Icons.translate), label: 'English', tooltip: "English"),
      ],
      onTap: (index) {
        if (widget.index != index) {
          if (widget.onIndexChanged != null) {
            widget.onIndexChanged!(index);
          }
          switch (index) {
            case 0:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const HomeScreen(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const ServicesScreen(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
              break;
            case 2:
              isUserLoggedIn().then((loggedIn) {
                if (loggedIn) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const PostItems(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LogIn()));
                }
              });
              break;

            case 3:
              isUserLoggedIn().then((loggedIn) {
                if (loggedIn) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const ProfileScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LogIn()));
                }
              });
              break;

            case 4:
              showDialog(
                context: context,
                barrierColor: Colors.transparent, // No dark overlay
                builder: (context) => LanguagePopup(
                  onLanguageSelected: (selectedLanguage) {
                    setState(() {
                      // Handle the selected language here
                      String code = selectedLanguage;
                      index = 4;
                      print(code);
                    });
                  },
                ),
              );
              break;
          }
        }
      },
    );
  }
}
