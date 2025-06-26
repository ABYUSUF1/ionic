import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/services/auth/firebase_auth_service.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/utils/validators.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/core/widgets/text_field/form_text_field.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/routing/app_router_name.dart';
import '../../../../auth/presentation/manager/auth/auth_cubit.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final user = getIt<FirebaseAuthService>().currentUser!;
  late final bool _isGoogleSignIn;

  @override
  void initState() {
    _emailController.text = user.email ?? '';

    // Check if signed in with Google
    _isGoogleSignIn = user.providerData.first.providerId == 'google.com';

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr(LocaleKeys.account_privacy_delete_account),
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                spacing: 16,
                children: [
                  EmptyStateWidget(
                    title: context.tr(LocaleKeys.account_privacy_are_you_sure),
                    subtitle: context.tr(
                      LocaleKeys.account_privacy_are_you_sure_desc,
                    ),
                    svgImage:
                        isDarkMode
                            ? AppAssets.illustrationsTrashIllustrationDark
                            : AppAssets.illustrationsTrashIllustrationLight,
                  ),
                  FormTextField(
                    title: LocaleKeys.auth_email.tr(),
                    controller: _emailController,
                    readOnly: true,
                  ),
                  if (!_isGoogleSignIn)
                    FormTextField(
                      title: LocaleKeys.auth_password.tr(),
                      controller: _passwordController,
                      validator:
                          (_) => Validators.validatePassword(
                            _passwordController.text.trim(),
                          ),
                    ),
                  const SizedBox(height: 30),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loading: (message) {},
                        error: (message) {},
                        unAuthenticated: () {
                          context.goNamed(AppRouterName.signInRoute);
                        },
                      );
                    },
                    child: CustomFilledButton(
                      text: LocaleKeys.account_privacy_delete_account.tr(),
                      buttonColor: theme.colorScheme.error,
                      onPressed: () {
                        if (!formKey.currentState!.validate() &&
                            !_isGoogleSignIn) {
                          return;
                        }

                        context.read<AuthCubit>().deleteUserAndData(
                          password:
                              _isGoogleSignIn
                                  ? ''
                                  : _passwordController.text.trim(),
                          context: context,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
