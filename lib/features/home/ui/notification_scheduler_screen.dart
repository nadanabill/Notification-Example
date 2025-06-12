import 'package:flutter/material.dart';
import '/core/services/local_notification_service.dart';


class NotificationSchedulerScreen extends StatefulWidget {
  const NotificationSchedulerScreen({super.key});

  @override
  State<NotificationSchedulerScreen> createState() =>
      _NotificationSchedulerScreenState();
}

class _NotificationSchedulerScreenState
    extends State<NotificationSchedulerScreen> {
  DateTime? _selectedDateTime;

  Future<void> _pickDateTime(BuildContext context) async {
    // Show date picker
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );

    if (pickedDate != null) {
      // Show time picker after date is selected
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  Future<void> _scheduleNotification() async {
    if (_selectedDateTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a date and time')));
      return;
    }

    if (_selectedDateTime!.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected time is in the past')));
      return;
    }

    await LocalNotificationService.scheduleNotification(
      id: 0,
      title: 'Reminder',
      body: 'Your scheduled notification at ${_selectedDateTime!.toString()}',
      scheduledTime: _selectedDateTime!,
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Notification scheduled!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Schedule Notification')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedDateTime == null
                  ? 'No date and time selected'
                  : 'Selected: ${_selectedDateTime!.toString()}',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickDateTime(context),
              child: Text('Pick Date and Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scheduleNotification,
              child: Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
