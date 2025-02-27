import 'package:etgebeya/measures/size_consts.dart';
import 'package:flutter/material.dart';

class ItemSpecifications extends StatelessWidget {
  final String title;
  final Map<String, String> specifications;

  const ItemSpecifications({
    super.key,
    required this.title,
    required this.specifications,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppSizes.smallGap),
      child: Container(
        padding: EdgeInsets.all(AppSizes.mediumGap),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.smallGap),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.secondaryFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.smallGap),
      
            // Specifications
            ...specifications.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${entry.key}: ',
                      style: TextStyle(
                        fontSize: AppSizes.tertiaryFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: AppSizes.tertiaryFontSize,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}