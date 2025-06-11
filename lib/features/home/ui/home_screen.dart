import 'package:flutter/material.dart';
import '/core/services/notification_service.dart';
import 'notification_daily_scheduler_screen.dart';

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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationDailySchedulerScreen(),
                  ),
                );
              },
              child: const Text('Schedule Daily Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
