import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/widgets/app_bar.dart';
import 'package:etgebeya/widgets/carousel_wheel.dart';
import 'package:etgebeya/widgets/categories.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/search_bar.dart';
import 'package:etgebeya/widgets/text_with_icon_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar
              const MyAppBar(),
              // Search Bar
              const MySearchBar(),
              // Carousel Slider
              const MyCarouselSlider(),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              // Category 
              MyCategories(),
               SizedBox(
                height: AppSizes.smallGap,
              ),
              TextWithIcon(text: "Recent Products", icon: Icons.filter_list_alt),
              SizedBox(
                height: AppSizes.smallGap,
              ),
            ],
          ),
        ),
      ),
      
      // Placeholder for BottomNavigationBar
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}