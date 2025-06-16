# Notification Example ✨

A Flutter application showing the implementation of three types of notifications (Local, FCM, and OneSignal) managed through a centralized notification service. This project showcases best practices for integrating and handling notifications in a Flutter application.

## 🪄 Features
- **Local Notifications**: Schedule and display local notifications using the `flutter_local_notifications` package.
- **Push Notifications**: Implement remote notifications via Firebase Cloud Messaging (FCM) and OneSignal.
- **In-App Notifications**: Handle in-app alerts for real-time user interaction.

## 🛠 Dependencies
- **flutter_local_notifications**: For scheduling and displaying local notifications.
- **permission_handler**: To manage notification permissions.
- **timezone**: For handling time when scheduling notifications.
- **firebase_core**: For integrating Firebase.
- **firebase_messaging**: For sending and receiving push notifications.
- **onesignal_flutter**: For enhanced push notification capabilities.

## 🤞 Notification Types
This project implements three types of notifications:

1. **Local Notifications**:
   - Powered by the `flutter_local_notifications` package.
   - Allows scheduling and displaying notifications locally on the device.

2. **Push Notifications**:
   - Integrated with Firebase Cloud Messaging and OneSignal for remote notifications.
   - Supports sending notifications from a server or external service.

3. **In-App Notifications**:
   - Displays real-time alerts within the app for user interaction.

## 🖇️ Notification Service
A centralized notification service system is implemented using three dedicated service files to handle all notification-related functionality:
- `firebase_cloud_messaging_service.dart`: Manages Firebase Cloud Messaging (FCM) for push notifications.
- `local_notification_service.dart`: Handles local notifications using the `flutter_local_notifications` package.
- `onesignal_service.dart`: Integrates OneSignal for enhanced push notification capabilities.
- Collectively, these files initialize and configure their respective notification services, manage permission requests, and provide methods to trigger notifications.
- Ensures a unified interface for all notification types, promoting code reusability and maintainability.

Example usage:
```dart
final notificationService = NotificationService();
await notificationService.init();
await notificationService.showLocalNotification(
  id: 1,
  title: 'Welcome',
  body: 'This is a local notification!',
);
```

<br/>

## 📜 Resources
The following resources were used to implement the notification system:
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- [permission_handler](https://pub.dev/packages/permission_handler)
- [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/flutter/client)
- [OneSignal Flutter SDK](https://documentation.onesignal.com/docs/flutter-sdk-setup)

<br/>

## 🫴 Contributing

- Contributions are welcome 🫱🏼‍🫲🏻
- If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

<br/>

## 💳 License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/Shalaby-VBS/Media_Viewer)
- This package is distributed under the MIT License. Feel free to use and modify it according to your project requirements.

<br/>
