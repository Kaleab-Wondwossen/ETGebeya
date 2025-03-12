import 'dart:async';
import 'package:etgebeya/measures/size_consts.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  final _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, String?>> ads = [
    {
      'image': 'images/promo1.png',
      'url':
          'https://drive.google.com/file/d/1WvOYC4oaKLFB1DApUlZvkE2xVcM8TCSw/view?usp=sharing',
      'name': 'Ad 2'
    },
    {
      'image': 'images/promo2.png',
      'url': 'https://adolescentgirlseth.org/',
      'name': 'Ad 3'
    },
    {
      'image': 'images/promo3.png',
      'url': 'https://adolescentgirlseth.org/',
      'name': 'Ad 4'
    },
  ];

  @override
  void initState() {
    super.initState();
    // Automatically show the popup with the second slide's image
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final secondSlide = ads[1]; // The second slide
      // final imageUrl = secondSlide['image'] ?? 'images/chereta1.png';
      // final url = secondSlide['url'] ?? 'https://default.url/';
    });

    // Start the timer for auto-sliding
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < ads.length - 1) {
        _currentPage++; // Increment the current page
      } else {
        _currentPage = 0; // Reset to the first page
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.largeGap * 6, // Adjust height as needed
          width: double.infinity,
          child: PageView.builder(
            controller: _controller,
            itemCount: ads.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page; // Update the current page
              });
            },
            itemBuilder: (context, index) {
              final ad = ads[index];
              final imageUrl = ad['image'] ?? 'images/chereta1.png';
              final url = ad['url'] ?? 'https://default.url/';
              final adName = ad['name'] ?? 'Unknown Ad';

              return _buildImageWithButton(
                imagePath: imageUrl,
                url: url,
                adName: adName,
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: ads.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color.fromRGBO(48, 111, 183, 1),
            dotColor: Color.fromRGBO(96, 132, 173, 1),
            dotWidth: 15,
            dotHeight: 15,
            spacing: 15,
          ),
        ),
      ],
    );
  }

  Widget _buildImageWithButton({
    required String imagePath,
    required String url,
    required String adName,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle tap on the image (e.g., open the URL)
      },
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(AppSizes.smallGap, 5, AppSizes.smallGap, 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.smallGap),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
