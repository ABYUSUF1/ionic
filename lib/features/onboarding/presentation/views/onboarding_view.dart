import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_underline_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/theme/app_colors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppAssets.illustrationsOnboardingIllustration1,
      "title": "Welcome to Ionic",
      "desc": "Your shopping cart's about to get a whole lot happier!",
    },
    {
      "image": AppAssets.illustrationsOnboardingIllustration2,
      "title": "Easy Payments",
      "desc": "Use multiple payment options with secure checkout.",
    },
    {
      "image": AppAssets.illustrationsOnboardingIllustration3,
      "title": "Fast Delivery",
      "desc": "Your orders arrive quickly and safely.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomUnderlineButton(
            onPressed: () {
              context.pushReplacement(AppRouterName.signInRoute);
            },
            text: "Skip",
            textStyle: theme.textTheme.bodyLarge!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          FadeInDown(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                            from: 30,
                            child: Image.asset(
                              onboardingData[index]["image"]!,
                              height: size.height / 2.5,
                            ),
                          ),
                          Text(
                            onboardingData[index]["title"]!,
                            style: theme.textTheme.headlineLarge!,
                          ),
                          Text(
                            onboardingData[index]["desc"]!,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.primaryColor,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomFilledButton(
                        text: "Next",
                        onPressed: () {
                          if (_controller.page == 2) {
                            context.pushReplacement(AppRouterName.signInRoute);
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
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
