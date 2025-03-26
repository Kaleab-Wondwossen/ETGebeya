import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class PriceAndRentButton extends StatelessWidget {
  final double price;

  const PriceAndRentButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.largeGap*.5, vertical: AppSizes.largeGap*.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         ElevatedButton(
            onPressed: () {
              // Handle rent now action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryIconColor, // Dark blue button
              padding:  EdgeInsets.symmetric(horizontal: AppSizes.largeGap*1.0, vertical: AppSizes.largeGap*.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.largeGap*.2),
              ),
            ),
            child: Text('Call Seller', style: TextStyle(fontSize:AppSizes.largeGap*.5, color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle rent now action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryIconColor, // Dark blue button
              padding:  EdgeInsets.symmetric(horizontal: AppSizes.largeGap*1.0, vertical: AppSizes.largeGap*.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.largeGap*.2),
              ),
            ),
            child: Text('Message Seller', style: TextStyle(fontSize:AppSizes.largeGap*.5, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
