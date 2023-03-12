import 'package:appwrite/appwrite.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:uuid/uuid.dart';

class ApiClient {
  static Client client = Client();
  static Account account = Account(client);
  static Storage storage = Storage(client);
  static Databases database = Databases(client);
  static Locale local = Locale(client);
  static Functions functions = Functions(client);
  static Avatars avatars = Avatars(client);
  static Teams teams = Teams(client);
  static Realtime realtime = Realtime(client);
  static Uuid uuid = const Uuid();

  /// Firebase Analytics
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  /// Firebase Analytics Observer
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
}
