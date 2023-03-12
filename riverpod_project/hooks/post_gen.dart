import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter packages get` after generation.
  await Process.run('flutter', ['packages', 'get']);

  // Run `flutter pub run build_runner build --delete-conflicting-outputs` pub get.
  await Process.run('flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs']);

  await Process.run('dart fix', [' --apply']);

  progress.complete();
}
