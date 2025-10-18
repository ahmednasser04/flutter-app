import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final int totalItems;
  final int currentPage;

  const OnboardingIndicator({
    super.key,
    required this.totalItems,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: index == currentPage ? 24.w : 8.w,
          decoration: BoxDecoration(
            color: index == currentPage
                ? AppColors.white
                : AppColors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}
