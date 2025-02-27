import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class FeaturedListings extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final int rate;
  final int views;

  const FeaturedListings({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rate,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.largeGap * 5,
      height: AppSizes.largeGap * 6.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 26, 46, 107).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageSection(),
          _buildDetailsSection(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.mediumGap),
            topRight: Radius.circular(AppSizes.mediumGap),
          ),
          child: Image.asset(
            imageUrl,
            height: AppSizes.largeGap * 5,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: AppSizes.smallGap,
          right: AppSizes.smallGap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(AppSizes.smallGap),
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: AppSizes.mediumIconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0,0,12,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: AppSizes.tertiaryFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  color: AppColors.primaryIconColor,
                  fontSize: AppSizes.tertiaryFontSize *.9,
                ),
              ),
            ],
          ),
          // Text(
          //   "New Gen 4 \nairpods \npro!!",
          //   style: TextStyle(fontSize: AppSizes.tertiaryFontSize*.6),
          // )
        ],
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[700],
          size: AppSizes.smallIconSize,
        ),
        SizedBox(width: AppSizes.smallGap * .5),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: AppSizes.tertiaryFontSize * .85,
          ),
        ),
      ],
    );
  }
}
