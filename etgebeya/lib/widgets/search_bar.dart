import 'package:etgebeya/measures/size_consts.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding:  EdgeInsets.fromLTRB(AppSizes.smallGap,0,AppSizes.smallGap,AppSizes.smallGap*.5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here ...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.smallGap),
                  ),
                  prefixIcon: const Icon(Icons.search, weight: 50,),
                ),
              ),
            );
  }
}