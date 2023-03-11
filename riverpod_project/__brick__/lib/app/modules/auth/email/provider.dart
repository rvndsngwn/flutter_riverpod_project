import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mohesu_model/mohesu_model.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';
import '../provider.dart';

class LoginController extends StateNotifier<int> {
  LoginController(this.ref) : super(0);

  final Ref ref;

  Future<String?>? onLogin(LoginData data) async {
    try {
      final String response = await ref.read(userStateProvider.notifier).signIn(
            email: data.name,
            password: data.password,
          );
      return response;
    } catch (error) {
      return "$error";
    }
  }

  Future<String?>? onSignUp(SignupData signupData) async {
    final userId = ApiClient.uuid.v4();
    try {
      final User user = User(
        email: signupData.name ?? "",
        fullName: signupData.additionalSignupData?['fullName'] ?? "",
        phone: signupData.additionalSignupData?['phone'] ?? "",
        address: signupData.additionalSignupData?['address'] ?? "",
        website: signupData.additionalSignupData?['website'] ?? "",
        userId: userId,
        role: UserRole.user.role,
        status: UserStatus.active.status,
        permissions: [
          "read(\"user:$userId\")",
          "update(\"user:$userId\")",
          "read(\"team:{Env.adminTeamId}\")",
          "update(\"team:{Env.adminTeamId}\")",
          "delete(\"team:{Env.adminTeamId}\")",
        ],
      );
      final String response = await ref.read(userStateProvider.notifier).signUp(
            user: user,
            password: signupData.password ?? "",
          );
      return response;
    } catch (error) {
      return "$error";
    }
  }

  Future<String?>? onRecoverPassword(String email, context) async {
    FocusScope.of(context).unfocus();
    final model.Token token = await ApiClient.account.createRecovery(
      email: email,
      url: 'https://server.mohesu.com/${RouteKey.resetPassword}',
    );
    logger.d(token.toMap());
    HapticFeedback.lightImpact();
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter valid password.';
    }
    if (value.length < 8) {
      return 'Must be more than 8 characters.';
    }
    return null;
  }

  Future<String?>? loginWithApple() async {
    try {
      await ApiClient.account.createOAuth2Session(provider: 'apple');
    } catch (e) {
      logger.e(e);
      return '$e';
    }
    return null;
  }

  void onSubmitAnimationCompleted(BuildContext context) {
    ref.read(userStateProvider.notifier).getCurrentUser();
  }

  String username = "contact@mohesu.com";
  String password = "Aq1sw2de3@123";
  String displayName = "Mohesu Admin";
  String phone = "+917015832329";
  String address = "1268 Sector 3, Rohtak, Haryana, India";
  String company = "Mohesu";
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, int>((ref) {
  return LoginController(ref);
});
