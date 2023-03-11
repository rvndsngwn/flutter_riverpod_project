import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:utils_widget/utils_widget.dart';
import '../../../common.dart';
import '../auth/provider.dart';
import '../profile/views/profile_view.dart';
import 'home_view.dart';

class DashBoard extends ConsumerStatefulWidget {
  DashBoard({
    required String selectedTab,
    Key? key,
  })  : index = dashBoardTabs.indexWhere((tab) => tab == selectedTab),
        super(key: key) {
    assert(index != -1);
  }

  final int index;

  @override
  ConsumerState<DashBoard> createState() => DashBoardState();
}

class DashBoardState extends ConsumerState<DashBoard>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: dashBoardTabs.length,
      vsync: this,
      initialIndex: widget.index,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DashBoard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    final package = ref.watch(packageInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          {
            {project_name.titleCase()}
          },
          style: TextStyle(
            fontFamily: 'harlow',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          package.when(
            data: (data) => IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () => showAboutDialog(
                context: context,
                applicationLegalese:
                    '© 2017 Mohesu, Inc.\nAll rights reserved.',
                applicationVersion:
                    "Version ${data.version}+${data.buildNumber}",
              ),
            ),
            error: (error, stack) => const SizedBox.shrink(),
            loading: () => const CircularProgressIndicator(),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _controller.index,
        onDestinationSelected: (index) =>
            context.go('${RouteKey.home}?id=${dashBoardTabs[index]}'),
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(PhosphorIcons.houseFill),
            icon: const Icon(PhosphorIcons.house),
            label: dashBoardTabs[0].toCapitalized(),
          ),
          NavigationDestination(
            selectedIcon: const Icon(PhosphorIcons.userFill),
            icon: const Icon(PhosphorIcons.user),
            label: dashBoardTabs[1].toCapitalized(),
          ),
        ],
      ),
      body: Builder(builder: (context) {
        if (user == null) {
          return EmptyWidget(
            title: "User not found, please login.",
            onPressed: () => context.go(RouteKey.emailLogin),
          );
        }
        return TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeView(),
            const ProfileView(),
          ],
        );
      }),
    );
  }
}

List<String> dashBoardTabs = [
  'home',
  'profile',
];
