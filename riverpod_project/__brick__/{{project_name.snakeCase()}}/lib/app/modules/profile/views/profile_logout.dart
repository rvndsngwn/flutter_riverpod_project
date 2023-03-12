import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import 'package:utils_widget/utils_widget.dart';
import '../../auth/provider.dart';
import '../../preferences/preferences_view/copyrights.dart';

class ProfileLogOutView extends ConsumerWidget {
  ProfileLogOutView({Key? key}) : super(key: key);

  final LoadingButtonController buttonController = LoadingButtonController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider.notifier);
    const Widget sizedBox = SizedBox(height: 8);
    return Column(
      children: [
        sizedBox,
        sizedBox,
        LoadingButton(
          controller: buttonController,
          onPressed: () => user.signOut(),
          primaryColor: context.secondary,
          child: Text(
            'Log Out'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sizedBox,
        sizedBox,
        const CopyRights(),
      ],
    );
  }
}
