import 'package:flutter/material.dart';
import 'notifications_screen.dart';

import '/core/services/notification_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await NotificationService.showNotification(
                  id: 1,
                  title: 'Notification Title',
                  body: 'Notification Body',
                );
              },
              child: const Text('Show Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // open date and time picker
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSchedulerScreen(),
                  ),
                );
              },
              child: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
