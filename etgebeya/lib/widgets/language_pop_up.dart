import 'package:etgebeya/measures/size_consts.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

class LanguagePopup extends StatelessWidget {
  final Function(String) onLanguageSelected;

  const LanguagePopup({super.key, required this.onLanguageSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Transparent background that blocks interactions with underlying widgets
        Positioned.fill(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        // Centered dialog content
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryIconColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Language',
                    style: TextStyle(
                      fontSize: AppSizes.secondaryFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildLanguageOption('English', 'en', context),
                  _buildLanguageOption('Amharic', 'am', context),
                  _buildLanguageOption('Oromo', 'om', context),
                  _buildLanguageOption('Tigrigna', 'ti', context),
                  _buildLanguageOption('Somali', "som", context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageOption(
      String language, String code, BuildContext context) {
    return ListTile(
      title: Container(
          height: AppSizes.largeGap,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color.fromRGBO(224, 224, 224, 1)),
          ),
          child: Center(
              child: Text(
            language,
            style: const TextStyle(
              color: Colors.white,
            ),
          ))),
      onTap: () {
        onLanguageSelected(code);
        Navigator.of(context).pop();
      },
    );
  }
}
