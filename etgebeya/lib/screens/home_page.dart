import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/screens/product_details_screen.dart';
import 'package:etgebeya/widgets/app_bar.dart';
import 'package:etgebeya/widgets/carousel_wheel.dart';
import 'package:etgebeya/widgets/categories.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/product_card.dart';
import 'package:etgebeya/widgets/search_bar.dart';
import 'package:etgebeya/widgets/text_with_icon_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
      body: SafeArea(
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
              TextWithIcon(
                  text: "Recent Products", icon: Icons.filter_list_alt),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    AppSizes.smallGap * 1.3, 0, AppSizes.smallGap * 1.3, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const ApartmentDetailScreen(),
                            transitionDuration:
                                Duration.zero, // No transition duration
                            reverseTransitionDuration:
                                Duration.zero, // No reverse transition duration
                          ),
                        );
                      },
                      child: const FeaturedListings(
                          imageUrl: "images/airpods.png",
                          name: "AirPod-Pro",
                          price: "\$200.00",
                          rate: 4,
                          views: 123),
                    ),
                    SizedBox(
                      width: AppSizes.smallGap,
                    ),
                    const FeaturedListings(
                        imageUrl: "images/macbook.png",
                        name: "MacBook Pro",
                        price: "\$200.00",
                        rate: 4,
                        views: 123),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.smallGap,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    AppSizes.smallGap * 1.3, 0, AppSizes.smallGap * 1.3, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const FeaturedListings(
                        imageUrl: "images/headphones.png",
                        name: "AirPod-Max",
                        price: "\$200.00",
                        rate: 4,
                        views: 123),
                    SizedBox(
                      width: AppSizes.smallGap,
                    ),
                    const FeaturedListings(
                        imageUrl: "images/macmini.png",
                        name: "Mac Mini",
                        price: "\$200.00",
                        rate: 4,
                        views: 123),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // Placeholder for BottomNavigationBar
      bottomNavigationBar: const MyNavBar(index: 0),
    );
  }
}
