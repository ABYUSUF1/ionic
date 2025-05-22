import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/services/data_source/local/local_app_settings_service.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_underline_button.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routing/app_router_name.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/language_widgets/language_switcher.dart';

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
      "title": LocaleKeys.onboarding_title1,
      "desc": LocaleKeys.onboarding_desc1,
    },
    {
      "image": AppAssets.illustrationsOnboardingIllustration2,
      "title": LocaleKeys.onboarding_title2,
      "desc": LocaleKeys.onboarding_desc2,
    },
    {
      "image": AppAssets.illustrationsOnboardingIllustration3,
      "title": LocaleKeys.onboarding_title3,
      "desc": LocaleKeys.onboarding_desc3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: LanguageSwitcher(),
        actions: [
          CustomUnderlineButton(
            onPressed: () {
              getIt<LocalAppSettingsService>().updateIsFirstTime(false);
              context.pushReplacement(AppRouterName.signInRoute);
            },
            text: LocaleKeys.common_skip.tr(),
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
                    itemCount: onboardingData.length,
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
                            onboardingData[index]["title"]!.tr(),
                            style: theme.textTheme.headlineLarge!,
                          ),
                          Text(
                            onboardingData[index]["desc"]!.tr(),
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
                        text: LocaleKeys.common_next.tr(),
                        onPressed: () {
                          if (_controller.page == 2) {
                            getIt<LocalAppSettingsService>().updateIsFirstTime(
                              false,
                            );
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
