import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_data.dart';

class FrameAnimationWidget extends StatefulWidget {
  const FrameAnimationWidget({super.key});

  @override
  State<FrameAnimationWidget> createState() => _FrameAnimationWidgetState();
}

class _FrameAnimationWidgetState extends State<FrameAnimationWidget> {
  int _currentFrameIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!mounted) return;
      setState(() {
        _currentFrameIndex = (_currentFrameIndex + 1) % animationFrames.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      animationFrames[_currentFrameIndex],
      height: 663.h,
      width: 509.75.w,
      fit: BoxFit.contain,
    );
  }
}
