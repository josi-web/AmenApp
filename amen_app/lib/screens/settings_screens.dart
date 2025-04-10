import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';

class JoinedEventsScreen extends StatelessWidget {
  const JoinedEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joined Events'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Example events
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.event, size: 30),
              ),
              title: Text('Event ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                      'Date: ${DateTime.now().add(Duration(days: index + 1))}'),
                  const SizedBox(height: 4),
                  Text('Location: Church ${index + 1}'),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Handle event details
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationSetting(
            title: 'Daily Devotion Reminders',
            subtitle: 'Get notified for daily devotionals',
            value: true,
            onChanged: (value) {},
          ),
          _buildNotificationSetting(
            title: 'Prayer Request Updates',
            subtitle: 'Get notified when someone prays for you',
            value: true,
            onChanged: (value) {},
          ),
          _buildNotificationSetting(
            title: 'Event Reminders',
            subtitle: 'Get notified about upcoming events',
            value: true,
            onChanged: (value) {},
          ),
          _buildNotificationSetting(
            title: 'New Sermons',
            subtitle: 'Get notified when new sermons are available',
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSetting({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildLanguageOption(
            context,
            language: 'English',
            isSelected: true,
            onTap: () {},
          ),
          _buildLanguageOption(
            context,
            language: 'Amharic',
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String language,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(language),
        trailing: isSelected
            ? Icon(
                Icons.check_circle,
                color: Theme.of(context).primaryColor,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingSection(
            title: 'Display',
            children: [
              _buildSettingOption(
                title: 'Font Size',
                subtitle: 'Adjust text size',
                trailing: const Text('Medium'),
                onTap: () {},
              ),
              _buildSettingOption(
                title: 'Verse Version',
                subtitle: 'Choose Bible translation',
                trailing: const Text('ESV'),
                onTap: () {},
              ),
            ],
          ),
          _buildSettingSection(
            title: 'Audio',
            children: [
              _buildSettingOption(
                title: 'Sound Effects',
                subtitle: 'Toggle app sounds',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              _buildSettingOption(
                title: 'Background Music',
                subtitle: 'Toggle background music',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          _buildSettingSection(
            title: 'Data',
            children: [
              _buildSettingOption(
                title: 'Clear Cache',
                subtitle: 'Free up storage space',
                onTap: () {},
              ),
              _buildSettingOption(
                title: 'Backup Data',
                subtitle: 'Save your data to cloud',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildSettingOption({
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
