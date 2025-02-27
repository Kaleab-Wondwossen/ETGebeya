import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class ApartmentDescription extends StatelessWidget {
  const ApartmentDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: AppSizes.secondaryFontSize * 1.2,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryIconColor,
            ),
          ),
          SizedBox(height: AppSizes.smallGap),
          Text(
            "$description...",
            style: TextStyle(
                fontSize: AppSizes.tertiaryFontSize,
                color: Colors.black87),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'show more',
            style: TextStyle(color: Colors.blue, fontSize: AppSizes.tertiaryFontSize),
          ),
        ],
      ),
    );
  }
}
