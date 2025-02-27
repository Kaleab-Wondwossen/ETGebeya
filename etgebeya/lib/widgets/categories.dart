import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

class MyCategories extends StatelessWidget {
  MyCategories({super.key});
  // final List<Map<String, String>> categories = [
  //   {'image': 'images/apparel.png', 'label': 'Apparel'},
  //   {'image': 'images/school.png', 'label': 'School'},
  //   {'image': 'images/sports.png', 'label': 'Sports'},
  //   {'image': 'images/electronic.png', 'label': 'Electronic'},
  //   {'image': 'images/all.png', 'label': 'All'},
  // ];
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.shopping_bag, 'label': 'Apparel'},
    {'icon': Icons.school, 'label': 'School'},
    {'icon': Icons.sports, 'label': 'Sports'},
    {'icon': Icons.electrical_services, 'label': 'Electronic'},
    {'icon': Icons.all_inclusive, 'label': 'All'},
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(AppSizes.smallGap*1.5,0,0,0),
          child: Text('Category', style: TextStyle(
            fontSize: AppSizes.secondaryFontSize,
            fontWeight: FontWeight.bold,
          ),),
        ),
        SizedBox(
          height: AppSizes.smallGap,
        ),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: categories.map((category) {
            return CategoryItem(
              icon: category['icon']!,
              label: category['label']!,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, 
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Image
        Icon(icon, size: AppSizes.mediumIconSize,color: AppColors.primaryIconColor,),
        SizedBox(height: AppSizes.smallGap), // Space between image and text
        // Category Label
        Text(
          label,
          style: TextStyle(
            fontSize: AppSizes.tertiaryFontSize,
            color: AppColors.secondaryText
          ),
        ),
      ],
    );
  }
}
