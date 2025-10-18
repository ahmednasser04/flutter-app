import 'package:flutter/material.dart';
import 'package:health_care_project/modules/loginscreen/loginscreen.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "OnboardingScreen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _navigateToLogin() {
    Navigator.pushNamed(context, Loginscreen.routeName);
  }

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      _navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (int page) {
          setState(() => _currentPage = page);
        },
        itemBuilder: (context, index) {
          return OnboardingContent(
            data: onboardingData[index],
            currentPage: _currentPage,
            onNext: _nextPage,
            onSkip: _navigateToLogin,
            isLastPage: index == onboardingData.length - 1,
            totalItems: onboardingData.length,
          );
        },
      ),
    );
  }
}
