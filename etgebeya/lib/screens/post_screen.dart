import 'package:etgebeya/widgets/app_bar.dart';
import 'package:etgebeya/widgets/nav_bar.dart';
import 'package:etgebeya/widgets/product_post_form.dart';
import 'package:flutter/material.dart';

class PostItems extends StatelessWidget {
  const PostItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(), 
            ProductPostForm(),
          ],
        ),
      )),
      bottomNavigationBar: MyNavBar(index: 2),
    );
  }
}