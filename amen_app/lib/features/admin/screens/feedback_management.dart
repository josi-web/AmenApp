import 'package:flutter/material.dart';

class FeedbackManagement extends StatefulWidget {
  const FeedbackManagement({Key? key}) : super(key: key);

  @override
  _FeedbackManagementState createState() => _FeedbackManagementState();
}

class _FeedbackManagementState extends State<FeedbackManagement> {
  String _filter = 'pending';
  List<Map<String, dynamic>> _testimonials = [];
  List<Map<String, dynamic>> _appFeedback = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // TODO: Replace with Laravel API call
    setState(() {
      _testimonials = [
        {
          'id': '1',
          'title': 'Great App',
          'userName': 'John Doe',
          'status': 'pending',
          'content': 'This app has been very helpful',
          'createdAt': DateTime.now(),
        },
      ];
      _appFeedback = [
        {
          'id': '1',
          'category': 'General',
          'content': 'Love the app!',
          'rating': 5,
          'createdAt': DateTime.now(),
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
          title: const Text('Feedback Management'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Testimonials'),
              Tab(text: 'App Feedback'),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() => _filter = value);
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'pending',
                  child: Text('Pending'),
                ),
                const PopupMenuItem(
                  value: 'approved',
                  child: Text('Approved'),
                ),
                const PopupMenuItem(
                  value: 'rejected',
                  child: Text('Rejected'),
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _buildTestimonialsTab(),
            _buildAppFeedbackTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialsTab() {
    return ListView.builder(
      itemCount: _testimonials.length,
      itemBuilder: (context, index) {
        final testimonial = _testimonials[index];
        return _buildTestimonialCard(testimonial['id'], testimonial);
      },
    );
  }

  Widget _buildAppFeedbackTab() {
    return ListView.builder(
      itemCount: _appFeedback.length,
      itemBuilder: (context, index) {
        final feedback = _appFeedback[index];
        return _buildFeedbackCard(feedback['id'], feedback);
      },
    );
  }

  Widget _buildTestimonialCard(String id, Map<String, dynamic> testimonial) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(testimonial['title'] ?? 'Untitled Testimonial'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('By: ${testimonial['userName'] ?? 'Anonymous'}'),
            Text('Status: ${testimonial['status']}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Testimony: ${testimonial['content']}'),
                const SizedBox(height: 8),
                Text('Created: ${_formatDate(testimonial['createdAt'])}'),
                const SizedBox(height: 16),
                if (testimonial['status'] == 'pending')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () =>
                            _updateTestimonialStatus(id, 'approved'),
                        child: const Text('Approve'),
                      ),
                      TextButton(
                        onPressed: () =>
                            _updateTestimonialStatus(id, 'rejected'),
                        child: const Text('Reject'),
                      ),
                    ],
                  ),
                if (testimonial['status'] == 'approved')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => _toggleFeatured(
                          id,
                          !(testimonial['isFeatured'] ?? false),
                        ),
                        child: Text(
                          testimonial['isFeatured'] == true
                              ? 'Remove from Featured'
                              : 'Feature Testimonial',
                        ),
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

  Widget _buildFeedbackCard(String id, Map<String, dynamic> feedback) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text('${feedback['category'] ?? 'General'} Feedback'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(feedback['content'] ?? ''),
            Text('Rating: ${feedback['rating']?.toString() ?? 'N/A'}'),
            Text('Submitted: ${_formatDate(feedback['createdAt'])}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => _deleteFeedback(id),
        ),
      ),
    );
  }

  Future<void> _updateTestimonialStatus(String id, String status) async {
    try {
      // TODO: Replace with Laravel API call
      setState(() {
        final index = _testimonials.indexWhere((t) => t['id'] == id);
        if (index != -1) {
          _testimonials[index]['status'] = status;
          _testimonials[index]['moderatedAt'] = DateTime.now();
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Testimonial $status successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating testimonial: $e')),
      );
    }
  }

  Future<void> _toggleFeatured(String id, bool isFeatured) async {
    try {
      // TODO: Replace with Laravel API call
      setState(() {
        final index = _testimonials.indexWhere((t) => t['id'] == id);
        if (index != -1) {
          _testimonials[index]['isFeatured'] = isFeatured;
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isFeatured
                ? 'Testimonial added to featured'
                : 'Testimonial removed from featured',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating testimonial: $e')),
      );
    }
  }

  Future<void> _deleteFeedback(String id) async {
    try {
      // TODO: Replace with Laravel API call
      setState(() {
        _appFeedback.removeWhere((f) => f['id'] == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting feedback: $e')),
      );
    }
  }

  String _formatDate(dynamic date) {
    if (date == null) return 'No date';
    return date.toString();
  }
}
