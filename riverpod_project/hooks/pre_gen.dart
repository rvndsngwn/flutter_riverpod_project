import 'package:mason/mason.dart';

void run(HookContext context) {
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
}
