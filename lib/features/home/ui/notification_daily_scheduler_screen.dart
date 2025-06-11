import 'package:flutter/material.dart';

import '/core/services/notification_service.dart';

class NotificationDailySchedulerScreen extends StatefulWidget {
  const NotificationDailySchedulerScreen({super.key});

  @override
  State<NotificationDailySchedulerScreen> createState() =>
      _NotificationDailySchedulerScreenState();
}

class _NotificationDailySchedulerScreenState
    extends State<NotificationDailySchedulerScreen> {
  DateTime? _selectedDateTime;

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  Future<void> _scheduleNotification() async {
    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a time')));
      return;
    }

    if (_selectedDateTime!.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected time is in the past')));
      return;
    }

    await NotificationService.scheduleDailyNotification(
      id: 0,
      title: 'Reminder',
      body: 'Your scheduled daily notification at ${_selectedDateTime!.toString()}',
      hour: _selectedDateTime!.hour,
      minute: _selectedDateTime!.minute,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Daily Notification scheduled!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule Daily Notification')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedDateTime == null
                  ? 'No time selected'
                  : 'Selected: ${_selectedDateTime!.toString()}',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickTime(context),
              child: Text('Pick Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scheduleNotification,
              child: Text('Schedule Daily Notification'),
            ),
          ],
        ),
      ),
    );
  }
}

