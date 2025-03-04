import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/widgets/categories.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBar(),
            SizedBox(
              height: AppSizes.smallGap,
            ),
            const MySearchBar(),
            SizedBox(
              height: AppSizes.smallGap,
            ),
            MyCategories(),
            SizedBox(
              height: AppSizes.mediumGap,
            ),
            // Add more widgets here for discover screen content
            Padding(
              padding:  EdgeInsets.fromLTRB(0,0,AppSizes.largeGap*6,0),
              child: Text("Recent Searches", style: TextStyle(
                fontSize: AppSizes.secondaryFontSize,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      )),
      bottomNavigationBar: MyNavBar(index: 1),
    );
  }
}