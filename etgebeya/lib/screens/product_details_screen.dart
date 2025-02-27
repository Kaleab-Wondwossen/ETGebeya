import 'package:flutter/material.dart';

import '../widgets/agent_info_card.dart';
import '../widgets/item_specification.dart';
import '../widgets/price_and_rent_btn.dart';
import '../widgets/product_description.dart';
import '../widgets/product_detail.dart';

class ApartmentDetailScreen extends StatelessWidget {
  const ApartmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ApartmentDetailHeader(
              imageUrl: 'images/airpods.png',
              apartmentName: 'AirPods Pro 2',
              location: 'Bole Alemnesh Plaza, Addis Ababa',
              bedrooms: 3,
              bathrooms: 2,
              rating: 4.5,
            ),
            ApartmentDescription(
              description:
                  'A Brand new Apples latest Ear buds. Air Pod Pro 2, with the latest technology and maximum compatablity and everything in between',
            ),
            ItemSpecifications(
              title: 'AirPods Max by Apple',
              specifications: {
                '🌈Color': 'Red, Blue, Green',
                '🏋Weight': '384.8 grams',
                '🔋Battery Life': 'Up to 20 hours',
                '🎧Noise Cancellation': 'Noise Cancellation',
                '🛜Connectivity': 'Bluetooth 5.0',
              },
            ),
            AgentInfoCard(
              agentName: 'Kaleab Wondwosson',
              agentImage: 'images/agent1.png',
            ),
            PriceAndRentButton(price: 28000),
          ],
        ),
      ),
    );
  }
}
