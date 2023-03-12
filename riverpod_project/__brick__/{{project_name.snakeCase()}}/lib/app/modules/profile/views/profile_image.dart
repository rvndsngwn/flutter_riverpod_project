import 'package:clay_containers/clay_containers.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:{{project_name.snakeCase()}}_model/{{project_name.snakeCase()}}_model.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:utils_widget/utils_widget.dart';

import '../../../../common.dart';
import '../provider.dart';

class ProfileImageView extends HookConsumerWidget {
  final User user;
  const ProfileImageView({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = useState(user.image.toUrl);
    final uploading = ref.watch(profileProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 12),
        Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: ClayContainer(
                  borderRadius: kRadialReactionRadius,
                  spread: 3,
                  height: 250,
                  width: double.infinity,
                  child: image.value.isNotEmpty
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.circular(kRadialReactionRadius),
                          child: FancyShimmerImage(
                            imageUrl: image.value,
                            boxFit: BoxFit.cover,
                            height: 250,
                            width: double.infinity,
                            shimmerBaseColor: context.primary,
                            shimmerHighlightColor: context.secondary,
                            errorWidget: Assets.mohesu.mohesu.image(),
                          ),
                        )
                      : Assets.mohesu.mohesu.image(),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: IconButton(
                    tooltip: "Your profile qr code for sharing",
                    icon: const Icon(PhosphorIcons.qrCode),
                    onPressed: () {
                      showPlatformDialog(
                        context: context,
                        builder: (context) => BasicDialogAlert(
                          title: Text('Your profile qr code'.toUpperCase()),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 16),
                              PrettyQr(
                                data:
                                    'server://profile/${user.userId}/${user.userRole}',
                                elementColor: context.primary,
                                image: const AssetImage(
                                  'assets/mohesu/m.png',
                                ),
                                size: 200,
                                roundEdges: true,
                              ),
                            ],
                          ),
                          actions: [
                            BasicDialogAction(
                              title: const Text("Back"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 20,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: uploading
                      ? const SizedBox(
                          width: 45,
                          height: 45,
                          child: CircularProgressIndicator(),
                        )
                      : IconButton(
                          tooltip: "Edit your profile image",
                          icon: const Icon(PhosphorIcons.userFocus),
                          onPressed: () async {
                            final url = await ref
                                .read(profileProvider.notifier)
                                .updateProfileImage();
                            if (url.isNotEmpty) image.value = url;
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: ClayContainer(
            borderRadius: kRadialReactionRadius,
            spread: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kRadialReactionRadius),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 12),
                    horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      user.fullName.toTitleCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ListTileAmazon(
                    leading: const Text("Email"),
                    title: Text(
                      user.email.toLowerCase(),
                    ),
                  ),
                  ListTileAmazon(
                    leading: const Text("Mobile"),
                    title: Text(
                      user.phone.toString(),
                    ),
                  ),
                  if (user.website.isNotEmpty)
                    ListTileAmazon(
                      leading: const Text("Website"),
                      title: Text(
                        user.website.toLowerCase(),
                      ),
                    ),
                  if (user.address.isNotEmpty)
                    ListTileAmazon(
                      leading: const Text("Address"),
                      title: Text(
                        user.address.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ListTileAmazon(
                    leading: const Text("Status"),
                    title: Text(
                      user.status.toTitleCase(),
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
