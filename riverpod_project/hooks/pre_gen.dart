import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Creating project');
  // Read vars.
  final name = context.vars['project_name'];

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
  await Future.delayed(Duration(seconds: 5));
  progress.complete();
}
