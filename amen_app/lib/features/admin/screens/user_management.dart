import 'package:flutter/material.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _users = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => _isLoading = true);
    try {
      // TODO: Replace with Laravel API call
      // Example mock data
      setState(() {
        _users = [
          {
            'id': '1',
            'name': 'John Doe',
            'email': 'john@example.com',
            'role': 'user',
            'status': 'active',
          },
          {
            'id': '2',
            'name': 'Jane Smith',
            'email': 'jane@example.com',
            'role': 'admin',
            'status': 'active',
          },
        ];
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading users: $e')),
      );
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadUsers,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Users',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // TODO: Implement search functionality with Laravel API
              },
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) {
                      final user = _users[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(user['name'][0]),
                          ),
                          title: Text(user['name']),
                          subtitle: Text(user['email']),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Chip(
                                label: Text(user['role']),
                                backgroundColor: user['role'] == 'admin'
                                    ? Colors.blue.withOpacity(0.1)
                                    : Colors.grey.withOpacity(0.1),
                              ),
                              const SizedBox(width: 8),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  // TODO: Implement actions with Laravel API
                                  switch (value) {
                                    case 'edit':
                                      _showEditUserDialog(user);
                                      break;
                                    case 'delete':
                                      _showDeleteConfirmation(user);
                                      break;
                                  }
                                },
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'edit',
                                    child: Text('Edit User'),
                                  ),
                                  const PopupMenuItem(
                                    value: 'delete',
                                    child: Text('Delete User'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddUserDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddUserDialog() {
    // TODO: Implement add user dialog with Laravel API
  }

  void _showEditUserDialog(Map<String, dynamic> user) {
    // TODO: Implement edit user dialog with Laravel API
  }

  void _showDeleteConfirmation(Map<String, dynamic> user) {
    // TODO: Implement delete confirmation with Laravel API
  }
}
