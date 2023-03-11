import 'dart:convert';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:utils_widget/utils_widget.dart';

import 'app/modules/auth/provider.dart';
import 'app/notification/notifications_service.dart';
import 'main.dart';
import 'common.dart';

@pragma('vm:entry-point')
onDidReceiveBackgroundNotificationResponse(
    NotificationResponse response) async {
  final container = ProviderContainer();
  final GoRouter router = container.read(routerProvider);
  logger.d(response.payload);
  if (response.payload == null) return;
  final payload = jsonDecode(response.payload!);
  final route = payload['route'];
  if (route != router.location) {
    router.push(route);
  }
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final GoRouter router = ref.watch(routerProvider);

  InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: darwinInitializationSettings,
  );

  @override
  void initState() {
    ref.read(userStateProvider.notifier).getCurrentUser();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) =>
          NotificationsService(router)
              .onDidReceiveNotificationResponse(response),
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: {
        {project_name.titleCase()}
      },
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      builder: (buildContext, widget) {
        return ConnectivityWidgetWrapper(
          disableInteraction: true,
          height: 80,
          child: widget ?? const PageNotFound(),
        );
      },
    );
  }
}
