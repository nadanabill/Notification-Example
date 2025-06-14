import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';

class OneSignalService {
  static final OneSignalService _instance = OneSignalService._internal();

  factory OneSignalService() => _instance;

  OneSignalService._internal();

  static const String _oneSignalAppId = 'YOUR_ONESIGNAL_APP_ID';

  /// Initializes OneSignal with Firebase and sets up notification handlers
  Future<void> initialize() async {
    try {
      // Initialize OneSignal
      OneSignal.initialize(_oneSignalAppId);

      // Request notification permission
      await OneSignal.Notifications.requestPermission(true);

      // Handle foreground notifications
      OneSignal.Notifications.addForegroundWillDisplayListener((event) {
        final notification = event.notification;
        debugPrint(
          "Foreground notification: ${notification.title} - ${notification.body}",
        );
        // you can show a custom UI
      });

      // Handle notification opened
      OneSignal.Notifications.addClickListener((event) {
        final notification = event.notification;
        debugPrint(
          "Notification opened: ${notification.title} - ${notification.body}",
        );
        final data = notification.additionalData;
        if (data != null) {
          _handleNotificationData(data);
        }
      });

      // Handle in-app message clicks
      OneSignal.InAppMessages.addClickListener((event) {
        debugPrint("In-app message clicked: ${event.result.actionId}");
        _handleInAppMessageAction(event.result.actionId, event.result.url);
      });

      debugPrint("OneSignal initialized successfully");
    } catch (e) {
      debugPrint("Error initializing OneSignal: $e");
    }
  }

  /// Handles additional data in notifications
  void _handleNotificationData(Map<String, dynamic> data) {
    debugPrint("Notification data: $data");
    // handle what you want with the data
    // Example: Navigate to a specific screen based on data
    // if (data.containsKey('screen')) {
    //  Navigator.pushNamed(context, data['screen']);
    //}
  }

  /// Handles in-app message actions
  void _handleInAppMessageAction(String? actionId, String? url) {
    if (actionId != null) {
      debugPrint("In-app message action: $actionId");
      // Handle specific actions
      // Example:
      // if (actionId == "open_profile") {
      //   Navigator.pushNamed(context, '/profile');
      // }
    }
    if (url != null) {
      debugPrint("Opening URL: $url");
      // Handle Open URL
    }
  }

  /// Adds a user tag for segmentation
  Future<void> addTag(String key, String value) async {
    try {
      await OneSignal.User.addTagWithKey(key, value);
      debugPrint("Tag added: $key=$value");
    } catch (e) {
      debugPrint("Error adding tag: $e");
    }
  }

  /// Removes a user tag
  Future<void> removeTag(String key) async {
    try {
      await OneSignal.User.removeTag(key);
      debugPrint("Tag removed: $key");
    } catch (e) {
      debugPrint("Error removing tag: $e");
    }
  }

  /// Triggers an in-app message
  Future<void> triggerInAppMessage(
    String triggerKey,
    String triggerValue,
  ) async {
    try {
      OneSignal.InAppMessages.addTrigger(triggerKey, triggerValue);
      debugPrint("In-app message triggered: $triggerKey=$triggerValue");
    } catch (e) {
      debugPrint("Error triggering in-app message: $e");
    }
  }

  /// Pauses or resumes in-app messages
  Future<void> setInAppMessagesPaused(bool paused) async {
    try {
      OneSignal.InAppMessages.paused(paused);
      debugPrint("In-app messages ${paused ? 'paused' : 'resumed'}");
    } catch (e) {
      debugPrint("Error setting in-app messages pause state: $e");
    }
  }
}
