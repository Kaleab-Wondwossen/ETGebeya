import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class ApartmentDetailHeader extends StatelessWidget {
  const ApartmentDetailHeader({
    super.key,
    required this.imageUrl,
    required this.apartmentName,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.rating,
  });

  final String apartmentName;
  final int bathrooms;
  final int bedrooms;
  final String imageUrl;
  final String location;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSizes.largeGap * 12,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/airpods.png'), // Load image from assets
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: AppSizes.largeGap * 2,
          left: AppSizes.largeGap * .5,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Back button functionality
            },
          ),
        ),
        Positioned(
          top: AppSizes.largeGap * 2,
          left: AppSizes.largeGap * 9.5,
          child: Row(
            children: [
              Text(
                rating.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.secondaryFontSize,
                ),
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 24.0,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: AppSizes.largeGap * .7,
          left: AppSizes.largeGap * .5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                apartmentName,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.smallGap),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: AppSizes.smallGap * .5),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.secondaryFontSize,
                    ),
                  ),
                ],
              ),
              SizedBox(width: AppSizes.smallGap * .5),
              Row(
                children: [
                  const Icon(Icons.bed, color: Colors.white),
                  SizedBox(width: AppSizes.smallGap*.5),
                  Text(
                    '$bedrooms ⭐️',
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: AppSizes.secondaryFontSize),
                  const Icon(Icons.bathtub, color: Colors.white),
                  SizedBox(width: AppSizes.smallGap*.5),
                  Text(
                    '$bathrooms 👁️‍🗨️',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
