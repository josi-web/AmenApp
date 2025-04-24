import 'package:flutter/material.dart';
import 'admin_home_screen.dart';

class CommentaryModeration extends StatefulWidget {
  const CommentaryModeration({Key? key}) : super(key: key);

  @override
  _CommentaryModerationState createState() => _CommentaryModerationState();
}

class _CommentaryModerationState extends State<CommentaryModeration> {
  String _filter = 'all';
  List<Map<String, dynamic>> _notes = [];
  List<Map<String, dynamic>> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // TODO: Replace with Laravel API call
    setState(() {
      _notes = [
        {
          'id': '1',
          'title': 'Study Note 1',
          'userName': 'John Doe',
          'status': 'pending',
          'content': 'This is a study note',
          'createdAt': DateTime.now(),
          'reportCount': 0,
        },
      ];
      _comments = [
        {
          'id': '1',
          'userName': 'Jane Smith',
          'status': 'reported',
          'content': 'This is a comment',
          'createdAt': DateTime.now(),
          'reportCount': 2,
          'reports': [
            {'reason': 'Inappropriate content'},
            {'reason': 'Spam'},
          ],
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
          title: const Text('Commentary Moderation'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Notes'),
              Tab(text: 'Comments'),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() => _filter = value);
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'all',
                  child: Text('All Content'),
                ),
                const PopupMenuItem(
                  value: 'reported',
                  child: Text('Reported'),
                ),
                const PopupMenuItem(
                  value: 'approved',
                  child: Text('Approved'),
                ),
                const PopupMenuItem(
                  value: 'removed',
                  child: Text('Removed'),
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _buildNotesTab(),
            _buildCommentsTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesTab() {
    return ListView.builder(
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        final note = _notes[index];
        return _buildContentCard(
          note['id'],
          note,
          isNote: true,
        );
      },
    );
  }

  Widget _buildCommentsTab() {
    return ListView.builder(
      itemCount: _comments.length,
      itemBuilder: (context, index) {
        final comment = _comments[index];
        return _buildContentCard(
          comment['id'],
          comment,
          isNote: false,
        );
      },
    );
  }

  Widget _buildContentCard(String id, Map<String, dynamic> content,
      {required bool isNote}) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(isNote ? content['title'] ?? 'Untitled Note' : 'Comment'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('By: ${content['userName'] ?? 'Anonymous'}'),
            Text('Status: ${content['status'] ?? 'pending'}'),
            if (content['reportCount'] != null && content['reportCount'] > 0)
              Text('Reports: ${content['reportCount']}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Content: ${content['content']}'),
                const SizedBox(height: 8),
                Text('Created: ${_formatDate(content['createdAt'])}'),
                if (content['reports'] != null &&
                    (content['reports'] as List).isNotEmpty) ...[
                  const SizedBox(height: 8),
                  const Text('Report Reasons:'),
                  ...List.from(content['reports']).map(
                    (report) => Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text('- ${report['reason']}'),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => _updateContentStatus(
                        id,
                        'approved',
                        isNote: isNote,
                      ),
                      child: const Text('Approve'),
                    ),
                    TextButton(
                      onPressed: () => _updateContentStatus(
                        id,
                        'removed',
                        isNote: isNote,
                      ),
                      child: const Text('Remove'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateContentStatus(String id, String status,
      {required bool isNote}) async {
    try {
      // TODO: Replace with Laravel API call
      final list = isNote ? _notes : _comments;
      final index = list.indexWhere((item) => item['id'] == id);
      if (index != -1) {
        setState(() {
          list[index]['status'] = status;
          list[index]['moderatedAt'] = DateTime.now();
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Content $status successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating content: $e')),
      );
    }
  }

  String _formatDate(dynamic date) {
    if (date == null) return 'No date';
    if (date is DateTime) return date.toString();
    return date.toString();
  }
}
