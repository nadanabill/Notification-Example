import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_example/core/services/notification_service.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background message: ${message.notification?.title}');
}

class FirebaseCloudMessagingService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  // Initialize FCM
  static Future<void> initialize() async {
    // Request permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    // Get and print FCM token
    token = await messaging.getToken();
    print('FCM Token: $token');

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground message: ${message.notification?.title}');
      // Add logic to show notification in UI
      final notification = message.notification;

      NotificationService.showNotification(
        id: 00,
        title: notification!.title!,
        body: notification.body!,
      );
    });

    // Handle notification clicks
    await setupInteractMessage();
  }

  // Handle notification clicks (background/terminated)
  static Future<void> setupInteractMessage() async {
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      print(
        'App opened from terminated state: ${initialMessage.notification?.title}',
      );
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('App opened from background: ${message.notification?.title}');
    });
  }

  // Subscribe to a topic
  static Future<void> subscribeToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
    print('Subscribed to topic: $topic');
  }

  // Unsubscribe from a topic
  static Future<void> unsubscribeFromTopic(String topic) async {
    await messaging.unsubscribeFromTopic(topic);
    print('Unsubscribed from topic: $topic');
  }
}
