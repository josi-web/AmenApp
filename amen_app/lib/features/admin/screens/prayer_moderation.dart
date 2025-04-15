import 'package:flutter/material.dart';

class PrayerModeration extends StatefulWidget {
  const PrayerModeration({super.key});

  @override
  State<PrayerModeration> createState() => _PrayerModerationState();
}

class _PrayerModerationState extends State<PrayerModeration> {
  // TODO: Replace with Laravel API calls
  final List<Map<String, dynamic>> _prayers = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    // Mock data - replace with Laravel API call
    setState(() {
      _prayers.addAll([
        {
          'id': '1',
          'userName': 'John Doe',
          'prayerText': 'Praying for peace in our community',
          'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
          'status': 'pending',
        },
        {
          'id': '2',
          'userName': 'Jane Smith',
          'prayerText': 'Healing for my family',
          'timestamp': DateTime.now().subtract(const Duration(hours: 5)),
          'status': 'approved',
        },
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Moderation'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _prayers.length,
        itemBuilder: (context, index) {
          final prayer = _prayers[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(prayer['userName']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(prayer['prayerText']),
                  Text(
                    _formatDate(prayer['timestamp']),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prayer['status'] == 'pending')
                    IconButton(
                      icon: const Icon(Icons.check),
                      onPressed: () =>
                          _updatePrayerStatus(prayer['id'], 'approved'),
                    ),
                  if (prayer['status'] == 'pending')
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () =>
                          _updatePrayerStatus(prayer['id'], 'rejected'),
                    ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deletePrayer(prayer['id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}';
  }

  void _updatePrayerStatus(String id, String status) {
    // TODO: Implement Laravel API call
    setState(() {
      final index = _prayers.indexWhere((p) => p['id'] == id);
      if (index != -1) {
        _prayers[index]['status'] = status;
      }
    });
  }

  void _deletePrayer(String id) {
    // TODO: Implement Laravel API call
    setState(() {
      _prayers.removeWhere((p) => p['id'] == id);
    });
  }
}
