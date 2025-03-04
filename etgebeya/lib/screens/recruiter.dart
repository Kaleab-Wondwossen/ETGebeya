import 'package:etgebeya/widgets/app_bar.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/post_job.dart';
import 'package:flutter/material.dart';

class RecruiterScreen extends StatelessWidget {
  const RecruiterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(),
            JobPostForm()
          ],
        ),
      )),
      bottomNavigationBar: MyNavBar(index: 2),
    );
  }
}
