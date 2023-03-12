import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../../common.dart';
import '../../auth/provider.dart';
import 'profile_image.dart';
import 'profile_logout.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(userStateProvider);
    const Widget divider = Divider(
      endIndent: 30,
      indent: 30,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            if (snapshot != null) ProfileImageView(user: snapshot),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: ClayContainer(
                borderRadius: kRadialReactionRadius,
                spread: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.only(left: 12),
                      horizontalTitleGap: 0,
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      title: Text(
                        'App Preferences',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                    divider,
                    settingOptionPattern(
                      Icons.settings_rounded,
                      'Preferences',
                      () => context.push(RouteKey.preferences),
                    ),
                    divider,
                    settingOptionPattern(
                      Icons.help,
                      'Help Center',
                      () => context.push(RouteKey.helpCenter),
                    ),
                    divider,
                    settingOptionPattern(
                      Icons.security,
                      'Privacy & Terms',
                      () => context.push(RouteKey.privacyAndTerms),
                    ),
                  ],
                ),
              ),
            ),
            ProfileLogOutView(),
          ],
        ),
      ),
    );
  }
}
