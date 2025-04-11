import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
      ),
      body: ListView(
        children: [
          RadioListTile(
            title: const Text('English'),
            value: 'en',
            groupValue: 'en',
            onChanged: (value) {},
          ),
          RadioListTile(
            title: const Text('Amharic'),
            value: 'am',
            groupValue: 'en',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
