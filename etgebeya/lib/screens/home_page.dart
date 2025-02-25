import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Scaffold(
    appBar: AppBar(
      title: Text('Home Page'),
    ),
    );
  }
}
