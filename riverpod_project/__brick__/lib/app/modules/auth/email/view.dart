import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';
import '../provider.dart';
import 'provider.dart';

class EmailLoginView extends HookConsumerWidget {
  const EmailLoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(packageInfoProvider);
    final controller = ref.watch(loginControllerProvider.notifier);
    return Scaffold(
      body: snapshot.when(
        data: (package) {
          return FlutterLogin(
            title: {{project_name.titleCase()}},
            passwordValidator: (value) =>
                controller.passwordValidator(value ?? ''),
            onSignup: (signupData) => controller.onSignUp(signupData),
            onLogin: (loginData) => controller.onLogin(loginData),
            onRecoverPassword: (data) =>
                controller.onRecoverPassword(data, context),
            onSubmitAnimationCompleted: () async {
              final user = await ApiClient.account.get();
              if (!user.emailVerification) {
                final Token token = await ApiClient.account.createVerification(
                  url: "mohesu://mohesu.com${RouteKey.emailVerify}",
                );
                logger.d(token.toMap());
                if (context.mounted) {
                  context.go(RouteKey.emailVerify);
                }
              } else {
                ref.read(userStateProvider.notifier).getCurrentUser();
              }
            },
            additionalSignupFields: [
              UserFormField(
                keyName: 'fullName',
                displayName: 'Full Name',
                userType: LoginUserType.name,
                fieldValidator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(3),
                ]),
                icon: const Icon(Icons.person),
                defaultValue: kDebugMode ? controller.displayName : "",
              ),
              UserFormField(
                keyName: 'phone',
                displayName: 'Phone',
                userType: LoginUserType.phone,
                fieldValidator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  (value) {
                    if (value != null && value.isNotEmpty) {
                      if (!RegExp(r"^(?:[+0]9)?\d{10,12}$").hasMatch(value)) {
                        return 'Please enter valid phone number.';
                      }
                    }
                    return null;
                  }
                ]),
                icon: const Icon(Icons.phone),
                defaultValue: kDebugMode ? controller.phone : "",
              ),
              UserFormField(
                keyName: 'address',
                displayName: 'Address',
                fieldValidator: FormBuilderValidators.required(),
                icon: const Icon(Icons.location_on),
                defaultValue: kDebugMode ? controller.address : "",
              ),
              UserFormField(
                keyName: 'company',
                displayName: 'Company',
                fieldValidator: FormBuilderValidators.required(),
                icon: const Icon(Icons.business),
                defaultValue: kDebugMode ? controller.company : "",
              ),
            ],
            footer: "App V. ${package.version}+${package.buildNumber}",
            savedEmail: kDebugMode ? controller.username : "",
            savedPassword: kDebugMode ? controller.password : "",
          );
        },
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        skipError: true,
      ),
    );
  }
}
