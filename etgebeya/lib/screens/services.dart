import 'package:etgebeya/screens/job_seeker.dart';
import 'package:etgebeya/screens/recruiter.dart';
import 'package:etgebeya/utils/colors.dart';
import 'package:flutter/material.dart';

import '../measures/size_consts.dart';


class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.secondaryIconColor,
            AppColors.primaryIconColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.largeGap * .5),
            child: Column(
              children: [
                const LoanHeader(),
                SizedBox(height: AppSizes.mediumGap),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        LoanCard(
                          title: 'Worker Onboard',
                          description:
                              'Connecting Talent with Opportunity: Where Recruiters Meet Ready Candidates!.',
                          buttonText: 'Explore',
                          onPressed: () {
                           Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const JobSeekerScreen(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                        ),
                        LoanCard(
                          title: 'Recruiter Onboard',
                          description:
                              'Your Next Career Move Starts Here: Empowering Job Seekers, One Perfect Match at a Time!',
                          buttonText: 'Explore',
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        const RecruiterScreen(),
                                transitionDuration:
                                    Duration.zero, // No transition duration
                                reverseTransitionDuration: Duration
                                    .zero, // No reverse transition duration
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoanHeader extends StatelessWidget {
  const LoanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        const Text(
          'Services',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const SizedBox(width: 48.0), // Placeholder for alignment
      ],
    );
  }
}

class LoanCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const LoanCard({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.largeGap * .5),
      margin: EdgeInsets.symmetric(vertical: AppSizes.largeGap * .4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.largeGap * .5),
        border: Border.all(color: Colors.white),
        color: Colors.white.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppSizes.secondaryFontSize * 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: AppSizes.mediumGap),
          Text(
            description,
            style: TextStyle(
              fontSize: AppSizes.tertiaryFontSize,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.mediumGap),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryIconColor,
              padding:
                  EdgeInsets.symmetric(horizontal: AppSizes.largeGap*1.5, vertical: AppSizes.largeGap*.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.largeGap*.2),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
