import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:utils_widget/utils_widget.dart';

class NotificationsService {
  final GoRouter router;

  NotificationsService(this.router);
  void onDidReceiveNotificationResponse(NotificationResponse response) async {
    logger.d(response.payload);
    if (response.payload == null) return;
    final payload = jsonDecode(response.payload!);
    final route = payload['route'];
    if (route != router.location) {
      router.push(route);
    }
  }
}
