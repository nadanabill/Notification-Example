import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_example/core/services/onesignal_service.dart';
import 'app.dart';
import 'core/services/firebase_cloud_messaging_service.dart';
import 'core/services/local_notification_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local notifications
  await LocalNotificationService.initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize FCM service
  await FirebaseCloudMessagingService.initialize();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Initialize OneSignal
  OneSignalService().initialize();

  runApp(const MyApp());
}
