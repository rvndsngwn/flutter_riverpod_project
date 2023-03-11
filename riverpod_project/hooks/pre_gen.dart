import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Creating project');
  // Read vars.
  final name = context.vars['project_name'];
  final description = context.vars['description'];
  final projectId = context.vars['project_id'];

  context.logger.info("brick version: 0.0.1");
  // Use the `Logger` instance.
  context.logger.info(r"""
$$\      $$\           $$\                                     
$$$\    $$$ |          $$ |                                    
$$$$\  $$$$ | $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$$\ $$\   $$\ 
$$\$$\$$ $$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  _____|$$ |  $$ |
$$ \$$$  $$ |$$ /  $$ |$$ |  $$ |$$$$$$$$ |\$$$$$$\  $$ |  $$ |
$$ |\$  /$$ |$$ |  $$ |$$ |  $$ |$$   ____| \____$$\ $$ |  $$ |
$$ | \_/ $$ |\$$$$$$  |$$ |  $$ |\$$$$$$$\ $$$$$$$  |\$$$$$$  |
\__|     \__| \______/ \__|  \__| \_______|\_______/  \______/
""");
  context.logger.info("Generating project $name for you by Mohesu team.");
  await Future.delayed(Duration(seconds: 2));
  await Process.run(
    'flutter',
    [
      'create',
      '--org $projectId',
      '--project-name $name',
      '--description $description'
    ],
    runInShell: true,
  );
  await Process.run('rm -rf', ['pubspec.yaml']);
  await Process.run('rm -rf', ['pubspec.lock']);
  await Process.run('rm -rf', ['lib/']);
  await Process.run('rm -rf', ['test/']);
  progress.complete();
}
