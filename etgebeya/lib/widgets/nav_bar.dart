import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../screens/Profile/profile_screen.dart';
import '../screens/home_page.dart';

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
      currentIndex: widget.index,
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
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.miscellaneous_services),
          label: 'Services',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const CategoriesPage()));
              break;
            case 2:
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const TenderDocument()));
              break;
            case 3:
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const SavedTenders()));
              break;
            case 4:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      const ProfileScreen(),
                  transitionDuration: Duration.zero, // No transition duration
                  reverseTransitionDuration:
                      Duration.zero, // No reverse transition duration
                ),
              );
              break;
          }
        }
      },
    );
  }
}
