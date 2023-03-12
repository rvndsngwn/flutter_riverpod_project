import 'package:flutter/material.dart';

import 'package:utils_widget/utils_widget.dart';

class PrivacyAndTermsView extends StatelessWidget {
  const PrivacyAndTermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy and Terms"),
      ),
      body: Column(
        children: [
          settingOptionPattern(
            Icons.security_rounded,
            'Terms and Conditions',
            () => LaunchUtils.launchUrl('https://www.mohesu.com/terms'),
          ),
          settingOptionPattern(
            Icons.admin_panel_settings_rounded,
            'Privacy Policy',
            () => LaunchUtils.launchUrl('https://www.mohesu.com/privacy'),
          ),
          settingOptionPattern(
            Icons.restart_alt_rounded,
            'Refund Policy',
            () => LaunchUtils.launchUrl('https://www.mohesu.com/refundPolicy'),
          ),
        ],
      ),
    );
  }
}
