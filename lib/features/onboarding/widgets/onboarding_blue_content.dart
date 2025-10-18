import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';
import 'onboarding_indicator.dart';

class OnboardingBlueContent extends StatelessWidget {
  final Map<String, dynamic> data;
  final int currentPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final bool isLastPage;
  final int totalItems;

  const OnboardingBlueContent({
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: constraints.maxHeight * 0.50,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    
                    children: [
                      Spacer(),
                    
                      
                      SizedBox(
                        width: 253.w,
                        child: Text(
                          data['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontFamily: 'SF Arabic',
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 296.w,
                        child: Text(
                          data['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white.withOpacity(0.8),
                            fontFamily: 'SF Arabic',
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      OnboardingIndicator(
                        totalItems: totalItems,
                        currentPage: currentPage,
                      ),
                      SizedBox(height: 60.h),
                      
                      
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/button.png",
                            fit: BoxFit.contain,
                            width: 180.w,
                            height: 100.h,
                          ),
                          Positioned(
                            bottom: 10.h,
                            child: TextButton(
                              onPressed: onNext,
                              child: Text(
                                "التالي",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'SF Arabic',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (!isLastPage)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(top: 25.0.h),
                                child: TextButton(
                                  onPressed: onSkip,
                                  child: Text(
                                    "تخطي",
                                    style: TextStyle(
                                      color: AppColors.white.withOpacity(0.8),
                                      fontSize: 16.sp,
                                      fontFamily: 'SF Arabic',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
