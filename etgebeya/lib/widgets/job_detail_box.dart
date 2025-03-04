import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';

class JobDetailBox extends StatelessWidget {
  const JobDetailBox({
    super.key,
    this.title = "Flutter Developper",
    this.imagePath = "images/code.png",
    this.deadlineText = "1 day ago",
    this.companyName = "Siinge Bank Share Company",
    this.price = "\$20000/month",
    this.size = "1 MB",
  });

  final String companyName;
  final String deadlineText;
  final String price;
  final String imagePath;
  final String title;
  final String size;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return Container(
      margin: EdgeInsets.all(AppSizes.smallGap),
      padding: EdgeInsets.all(AppSizes.smallGap),
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 240, 240, 240),
        color: const Color.fromARGB(255, 243, 243, 240),
        borderRadius: BorderRadius.circular(15),
        border: Border(
          left: BorderSide(
            color: AppColors.primaryIconColor,
            width: AppSizes.smallGap * .3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Image on the left
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.smallGap * .7),
                child: Image.asset(
                  imagePath, // Replace with your image asset or network path
                  width: AppSizes.largeGap * 2,
                  height: AppSizes.largeGap * 2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: AppSizes.smallGap),
              // Text information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.tertiaryFontSize * .8,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: AppSizes.smallGap * .5),
                    Text(
                      companyName,
                      style: TextStyle(
                        color: AppColors.primaryIconColor,
                        fontSize: AppSizes.tertiaryFontSize * .8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.smallGap),
          // Tender Documents Section
          Container(
            padding: EdgeInsets.all(AppSizes.smallGap),
            decoration: BoxDecoration(
              // color: const Color.fromARGB(255, 255, 255, 255),
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.smallGap),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tender details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Job Documents',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.tertiaryFontSize,
                          color:Colors.black,),
                          
                    ),
                    SizedBox(height: AppSizes.smallGap * .6),
                    Text(
                      "Deadline $deadlineText",
                      style:
                          TextStyle(fontSize: AppSizes.tertiaryFontSize * .8, color:Colors.black,),
                    ),
                    SizedBox(height: AppSizes.smallGap * .6),
                    Text(
                      "Price: $price Birr",
                      style: TextStyle(
                          color: AppColors.primaryIconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.tertiaryFontSize * .8),
                    ),
                  ],
                ),
                // Buy Button and file size
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryIconColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSizes.smallGap),
                        ),
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSizes.tertiaryFontSize),
                      ),
                    ),
                    SizedBox(height: AppSizes.smallGap),
                    Text(
                      'File size: $size',
                      style:
                          TextStyle(fontSize: AppSizes.tertiaryFontSize * .8, color:  Colors.black,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Bottom icons
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.refresh,
                    color: AppColors.primaryIconColor),
                SizedBox(width: AppSizes.smallGap),
                const Icon(Icons.double_arrow,
                    color: AppColors.primaryIconColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
