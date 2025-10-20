import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'frame_animation_widget.dart';

class OnboardingImage extends StatelessWidget {
  final bool isAnimated;
  const OnboardingImage({super.key, required this.isAnimated});

  @override
  Widget build(BuildContext context) {
    if (isAnimated) return const FrameAnimationWidget();

    return Container(
      child: Stack(
        
        alignment: Alignment.center,
        children: [
          Image.asset( 'assets/images/bg.png', height: 272.h, width: 279.w, ),
          Image.asset( 'assets/images/doctor.png', height: 389.h, width: 389.w, ),
        ],
      ),
    );
  }
}
