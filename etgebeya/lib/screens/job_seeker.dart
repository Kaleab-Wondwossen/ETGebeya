import 'package:etgebeya/widgets/app_bar.dart';
import 'package:etgebeya/widgets/job_detail_box.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class JobSeekerScreen extends StatelessWidget {
  const JobSeekerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(),
            MySearchBar(),
            JobDetailBox(),
            JobDetailBox(
              title: "Seinor Software Engineer",
              imagePath: "images/code.png",
              deadlineText: "22 Days",
              companyName: "MMCY tech",
              price: "\$20000/month",
              size: "1 MB",
            )
          ],
        ),
      )),
      bottomNavigationBar: MyNavBar(index: 3),
    );
  }
}