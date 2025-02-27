import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class AgentInfoCard extends StatelessWidget {
  final String agentName;
  final String agentImage;

  const AgentInfoCard({
    super.key,
    required this.agentName,
    required this.agentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.symmetric(
          horizontal: AppSizes.largeGap * .5, vertical: AppSizes.largeGap * .5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.largeGap),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage:
              const AssetImage('images/agent1.png'), // Load image from assets
          radius: AppSizes.largeGap,
        ),
        title: Text(agentName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Seller'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.phone, color:AppColors.primaryIconColor),
            SizedBox(width: AppSizes.mediumGap),
            const Icon(Icons.message, color: AppColors.primaryIconColor),
          ],
        ),
      ),
    );
  }
}
