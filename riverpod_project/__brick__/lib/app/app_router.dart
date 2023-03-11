import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mohesu_model/mohesu_model.dart';

import '../common.dart';
import 'modules/auth/email/email_verify.dart';
import 'modules/auth/email/reset_password.dart';
import 'modules/auth/email/view.dart';
import 'modules/auth/otp/otp_confirm_view.dart';
import 'modules/auth/provider.dart';
import 'modules/auth/otp/view.dart';
import 'modules/home/dash_board.dart';
import 'modules/preferences/help_center/help_center_view.dart';
import 'modules/preferences/preferences_view/preferences_view.dart';
import 'modules/preferences/privacy_and_terms/privacy_and_terms_view.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    String? path;
    return GoRouter(
      redirect: (_, state) {
        if (state.subloc == RouteKey.otpVerification ||
            state.subloc == RouteKey.emailVerify ||
            state.subloc == RouteKey.resetPassword) {
          return state.location;
        }
        if (state.subloc != RouteKey.emailLogin &&
            state.subloc != RouteKey.home) {
          path = state.location;
        }
        final user = ref.read(userStateProvider);
        final bool loggedIn = (user != null);
        final bool loggingIn = state.subloc == RouteKey.emailLogin;
        if (!loggedIn) {
          return loggingIn ? null : RouteKey.emailLogin;
        }
        if (loggingIn) {
          return path ?? RouteKey.home;
        }
        return null;
      },
      debugLogDiagnostics: kDebugMode,
      observers: [ApiClient.observer],
      errorBuilder: (context, state) => const PageNotFound(),
      refreshListenable: RouterNotifier(ref),
      routes: [
        GoRoute(
          path: RouteKey.home,
          builder: (context, state) => DashBoard(
            key: state.pageKey,
            selectedTab: state.queryParams['id'] ?? "home",
          ),
        ),

        /// * ================= Auth Routes =================
        GoRoute(
          path: RouteKey.emailLogin,
          builder: (context, state) => const EmailLoginView(),
        ),
        GoRoute(
          path: RouteKey.otpLogin,
          builder: (context, state) => const OtpLoginView(),
        ),
        GoRoute(
          path: RouteKey.otpVerification,
          builder: (context, state) => const OtpConfirmView(),
        ),
        GoRoute(
          path: RouteKey.emailVerify,
          builder: (context, state) => const EmailVerifyView(),
        ),
        GoRoute(
          path: RouteKey.resetPassword,
          builder: (context, state) => const ResetPasswordView(),
        ),

        /// * ================= Preferences Routes =================
        GoRoute(
          path: RouteKey.preferences,
          builder: (context, state) => const PreferencesView(),
        ),
        GoRoute(
          path: RouteKey.privacyAndTerms,
          builder: (context, state) => const PrivacyAndTermsView(),
        ),
        GoRoute(
          path: RouteKey.helpCenter,
          builder: (context, state) => const HelpCenterView(),
        ),
      ],
    );
  },
);

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<User?>(
      userStateProvider,
      (_, __) => notifyListeners(),
    );
  }
}

class RouteKey {
  static const String home = "/";

  /// * ================= Auth Routes =================
  static const String otpLogin = "/otp-login";
  static const String emailLogin = "/email-login";
  static const String otpVerification = "/otp-verification";
  static const String emailVerify = "/email-verification";
  static const String resetPassword = "/reset-password";

  /// * ================= App Routes =================
  static const String preferences = "/preferences";
  static const String helpCenter = "/help-center";
  static const String privacyAndTerms = "/privacy-and-terms";
}
