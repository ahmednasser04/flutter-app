import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_image..dart';
import 'onboarding_blue_content.dart';

class OnboardingContent extends StatelessWidget {
  final Map<String, dynamic> data;
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final bool isLastPage;
  final int totalItems;

  const OnboardingContent({
    super.key,
    required this.data,
    required this.currentPage,
    required this.onNext,
    required this.onSkip,
    required this.isLastPage,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    final isAnimated = data['isAnimated'] ?? false;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: .53.sh,
            child: OnboardingImage(isAnimated: isAnimated),
          ),
        ),
        OnboardingBlueContent(
          data: data,
          currentPage: currentPage,
          onNext: onNext,
          onSkip: onSkip,
          isLastPage: isLastPage,
          totalItems: totalItems,
        ),
      ],
    );
  }
}
