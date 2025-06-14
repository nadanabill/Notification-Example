import 'package:flutter/material.dart';
import 'package:notification_example/core/services/onesignal_service.dart';
import '/core/services/local_notification_service.dart';
import 'notification_scheduler_screen.dart';
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
                await LocalNotificationService.showNotification(
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                OneSignalService().addTag('0', 'test').then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('OneSignal Tag added: key: 0 value: test'),
                    ),
                  );
                });
              },
              child: const Text('Add OneSignal Test Tag'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                OneSignalService().removeTag('0').then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'OneSignal Tag removed: key: 0 value: test',
                      ),
                    ),
                  );
                });
              },
              child: const Text('Remove OneSignal Test Tag'),
            ),
          ],
        ),
      ),
    );
  }
}
