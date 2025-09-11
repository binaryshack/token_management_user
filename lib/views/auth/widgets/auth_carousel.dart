import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_page_carousel_provider.dart';
import 'package:token_management_user/core/constants/colors.dart';

class AuthCarousel extends StatelessWidget {
  const AuthCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://picsum.photos/id/1015/800/400',
      'https://picsum.photos/id/1016/800/400',
      'https://picsum.photos/id/1018/800/400',
      'https://picsum.photos/id/1020/800/400',
    ];
    final carouselProvider = Provider.of<CarouselProvider>(context);

    // Get screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CarouselSlider(
          items: images
              .map(
                (item) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: screenHeight * 0.5,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              carouselProvider.setCurrentIndex(index);
            },
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: carouselProvider.currentIndex == entry.key
                    ? AppColors.primary
                    : AppColors.grey300,
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Text(
          "Skip the Queue With Qapp",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ],
    );
  }
}
