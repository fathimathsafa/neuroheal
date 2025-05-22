import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/constants/app_text_styles.dart';
import 'package:neuroheal/presentation/bottom_navigation_screen/view/bottom_navigation.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != currentPage) {
        setState(() => currentPage = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingSlide(
                image: 'assets/onboarding/onboarding1.jpg',
                title: "Find Trusted Doctors",
                subtitle:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
                showButton: false,
              ),
              OnboardingSlide(
                image: 'assets/onboarding/onboarding2.jpg',
                title: "Choose Best Doctors",
                subtitle:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
                showButton: false,
              ),
              OnboardingSlide(
                image: 'assets/onboarding/onboarding3.jpg',
                title: "Easy Appointments",
                subtitle:
                    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
                showButton: true,
                onGetStarted: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),

          // Dots
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: DotIndicator(isActive: currentPage == index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final bool showButton;
  final VoidCallback? onGetStarted;

  const OnboardingSlide({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.showButton,
    this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150.h,
          left: -150.w,
          child: Container(
            width: 280.w,
            height: 280.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0EBE7E),
            ),
          ),
        ),
        Positioned(
          top: 100.h,
          left: 60.w,
          child: CircleAvatar(
            radius: 170.r,
            backgroundImage: AssetImage(image),
          ),
        ),
        Positioned.fill(
          top: 400.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 60.h, bottom: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.onBoardingHeadding,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      subtitle,
                      style: AppTextStyles.onBoardingSubHeadding,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  if (showButton)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigationScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0EBE7E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 16.h,
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 12.w : 8.w,
      height: 8.w,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0EBE7E) : Colors.grey,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
