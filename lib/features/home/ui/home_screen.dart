import 'package:flutter/material.dart';

import '../../../core/services/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: TextButton(
          onPressed: () async {
            await NotificationService.showNotification(
              id: '1',
              title: 'Notification Title',
              body: 'Notification Body',
            );
          },
          child: const Text('Show Notification'),
        ),
      ),
    );
  }
}
