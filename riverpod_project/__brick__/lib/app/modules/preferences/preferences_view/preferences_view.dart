import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'copyrights.dart';

class PreferencesView extends ConsumerWidget {
  const PreferencesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences"),
      ),
      body: Column(
        children: [const CopyRights()],
      ),
    );
  }
}
