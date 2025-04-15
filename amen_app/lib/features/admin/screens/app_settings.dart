import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = true;
  Map<String, dynamic> _settings = {};

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      // TODO: Replace with Laravel API call
      setState(() {
        _settings = {
          'darkMode': false,
          'useSystemTheme': true,
          'dailyVerseNotifications': true,
          'prayerTimeReminders': true,
          'bibleVersions': [
            {'name': 'NIV', 'language': 'English', 'isEnabled': true},
            {'name': 'KJV', 'language': 'English', 'isEnabled': true},
          ],
          'languages': [
            {'name': 'English', 'code': 'en', 'isEnabled': true},
            {'name': 'Spanish', 'code': 'es', 'isEnabled': true},
          ],
          'faqs': [
            {
              'question': 'How do I change my password?',
              'answer': 'Go to Settings > Account > Change Password',
            },
          ],
        };
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading settings: $e')),
      );
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Settings'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'General'),
              Tab(text: 'Bible Versions'),
              Tab(text: 'Languages'),
              Tab(text: 'FAQ'),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: TabBarView(
            children: [
              _buildGeneralSettings(),
              _buildBibleVersionSettings(),
              _buildLanguageSettings(),
              _buildFAQSettings(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _saveSettings,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  Widget _buildGeneralSettings() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Theme Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _settings['darkMode'] ?? false,
            onChanged: (value) {
              setState(() => _settings['darkMode'] = value);
            },
          ),
          SwitchListTile(
            title: const Text('System Theme'),
            value: _settings['useSystemTheme'] ?? true,
            onChanged: (value) {
              setState(() => _settings['useSystemTheme'] = value);
            },
          ),
          const Divider(),
          const Text(
            'Notification Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Daily Verse Notifications'),
            value: _settings['dailyVerseNotifications'] ?? true,
            onChanged: (value) {
              setState(() => _settings['dailyVerseNotifications'] = value);
            },
          ),
          SwitchListTile(
            title: const Text('Prayer Time Reminders'),
            value: _settings['prayerTimeReminders'] ?? true,
            onChanged: (value) {
              setState(() => _settings['prayerTimeReminders'] = value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBibleVersionSettings() {
    final bibleVersions = List<Map<String, dynamic>>.from(
      _settings['bibleVersions'] ?? [],
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bibleVersions.length,
            itemBuilder: (context, index) {
              final version = bibleVersions[index];
              return Card(
                child: ListTile(
                  title: Text(version['name'] ?? ''),
                  subtitle: Text(version['language'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: version['isEnabled'] ?? true,
                        onChanged: (value) {
                          setState(() {
                            bibleVersions[index]['isEnabled'] = value;
                            _settings['bibleVersions'] = bibleVersions;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            bibleVersions.removeAt(index);
                            _settings['bibleVersions'] = bibleVersions;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showAddBibleVersionDialog,
            child: const Text('Add Bible Version'),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSettings() {
    final languages = List<Map<String, dynamic>>.from(
      _settings['languages'] ?? [],
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              return Card(
                child: ListTile(
                  title: Text(language['name'] ?? ''),
                  subtitle: Text(language['code'] ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Switch(
                        value: language['isEnabled'] ?? true,
                        onChanged: (value) {
                          setState(() {
                            languages[index]['isEnabled'] = value;
                            _settings['languages'] = languages;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            languages.removeAt(index);
                            _settings['languages'] = languages;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _showAddLanguageDialog,
            child: const Text('Add Language'),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSettings() {
    final faqs = List<Map<String, dynamic>>.from(
      _settings['faqs'] ?? [],
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: faqs.length,
            itemBuilder: (context, index) {
              final faq = faqs[index];
              return Card(
                child: ExpansionTile(
                  title: Text(faq['question'] ?? ''),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(faq['answer'] ?? ''),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _showEditFAQDialog(index, faq),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    faqs.removeAt(index);
                                    _settings['faqs'] = faqs;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showEditFAQDialog(-1, null),
            child: const Text('Add FAQ'),
          ),
        ],
      ),
    );
  }

  void _showAddBibleVersionDialog() {
    final nameController = TextEditingController();
    final languageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Bible Version'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Version Name'),
            ),
            TextField(
              controller: languageController,
              decoration: const InputDecoration(labelText: 'Language'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final bibleVersions = List<Map<String, dynamic>>.from(
                _settings['bibleVersions'] ?? [],
              );
              bibleVersions.add({
                'name': nameController.text,
                'language': languageController.text,
                'isEnabled': true,
              });
              setState(() => _settings['bibleVersions'] = bibleVersions);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showAddLanguageDialog() {
    final nameController = TextEditingController();
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Language Name'),
            ),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(labelText: 'Language Code'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final languages = List<Map<String, dynamic>>.from(
                _settings['languages'] ?? [],
              );
              languages.add({
                'name': nameController.text,
                'code': codeController.text,
                'isEnabled': true,
              });
              setState(() => _settings['languages'] = languages);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditFAQDialog(int index, Map<String, dynamic>? faq) {
    final questionController =
        TextEditingController(text: faq?['question'] ?? '');
    final answerController = TextEditingController(text: faq?['answer'] ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index == -1 ? 'Add FAQ' : 'Edit FAQ'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final faqs = List<Map<String, dynamic>>.from(
                _settings['faqs'] ?? [],
              );
              final newFaq = {
                'question': questionController.text,
                'answer': answerController.text,
              };
              if (index == -1) {
                faqs.add(newFaq);
              } else {
                faqs[index] = newFaq;
              }
              setState(() => _settings['faqs'] = faqs);
              Navigator.pop(context);
            },
            child: Text(index == -1 ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveSettings() async {
    try {
      // TODO: Replace with Laravel API call
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Settings saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving settings: $e')),
      );
    }
  }
}
