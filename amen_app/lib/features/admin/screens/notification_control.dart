import 'package:flutter/material.dart';
import 'admin_home_screen.dart';

class NotificationControl extends StatefulWidget {
  const NotificationControl({Key? key}) : super(key: key);

  @override
  _NotificationControlState createState() => _NotificationControlState();
}

class _NotificationControlState extends State<NotificationControl> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  String _selectedType = 'announcement';
  TimeOfDay? _selectedTime;
  List<Map<String, dynamic>> _notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _loadNotifications() async {
    // TODO: Replace with Laravel API call
    setState(() {
      _notifications = [
        {
          'id': '1',
          'title': 'Welcome Message',
          'message': 'Welcome to our app!',
          'type': 'announcement',
          'sentAt': DateTime.now(),
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminHomeScreen(),
                ),
              );
            },
          ),
          title: const Text('Notification Control'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Send Notifications'),
              Tab(text: 'Notification History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSendNotificationTab(),
            _buildNotificationHistoryTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildSendNotificationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Notification Type',
              ),
              items: const [
                DropdownMenuItem(
                  value: 'announcement',
                  child: Text('Announcement'),
                ),
                DropdownMenuItem(
                  value: 'devotion_reminder',
                  child: Text('Daily Devotion Reminder'),
                ),
                DropdownMenuItem(
                  value: 'prayer_reminder',
                  child: Text('Prayer Time Reminder'),
                ),
              ],
              onChanged: (value) {
                setState(() => _selectedType = value!);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            if (_selectedType.contains('reminder')) ...[
              const SizedBox(height: 16),
              ListTile(
                title: Text(_selectedTime == null
                    ? 'Select Time'
                    : 'Time: ${_selectedTime!.format(context)}'),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() => _selectedTime = time);
                  }
                },
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _sendNotification,
              child: const Text('Send Notification'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationHistoryTab() {
    return ListView.builder(
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        final notification = _notifications[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(notification['title'] ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification['message'] ?? ''),
                Text('Type: ${notification['type']}'),
                Text('Sent: ${_formatDate(notification['sentAt'])}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteNotification(notification['id']),
            ),
          ),
        );
      },
    );
  }

  Future<void> _sendNotification() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      // TODO: Replace with Laravel API call
      setState(() {
        _notifications.add({
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
          'title': _titleController.text,
          'message': _messageController.text,
          'type': _selectedType,
          'sentAt': DateTime.now(),
        });
      });

      // Clear form
      _titleController.clear();
      _messageController.clear();
      setState(() => _selectedTime = null);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification sent successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending notification: $e')),
      );
    }
  }

  Future<void> _deleteNotification(String id) async {
    try {
      // TODO: Replace with Laravel API call
      setState(() {
        _notifications.removeWhere((n) => n['id'] == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting notification: $e')),
      );
    }
  }

  String _formatDate(dynamic date) {
    if (date == null) return 'No date';
    return date.toString();
  }
}
