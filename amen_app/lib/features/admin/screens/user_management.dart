import 'package:flutter/material.dart';
import 'admin_home_screen.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  static _UserManagementState? of(BuildContext context) {
    return context.findAncestorStateOfType<_UserManagementState>();
  }

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  bool _isLoading = true;
  List<Map<String, dynamic>> _users = [];
  final TextEditingController _searchController = TextEditingController();
  String _newUserName = '';
  String _newUserEmail = '';
  String _newUserRole = 'user';

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

  Future<void> refreshUsers() async {
    await _loadUsers();
  }

  Future<void> showAddUserDialog() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => _newUserName = value,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => _newUserEmail = value,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Role'),
              value: _newUserRole,
              items: const [
                DropdownMenuItem(value: 'user', child: Text('User')),
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
              ],
              onChanged: (value) {
                if (value != null) {
                  _newUserRole = value;
                }
              },
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
              // TODO: Implement user creation with Laravel API
              Navigator.pop(context, {
                'name': _newUserName,
                'email': _newUserEmail,
                'role': _newUserRole,
              });
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (result != null) {
      // TODO: Implement user creation with Laravel API
      setState(() {
        _users.add({
          'id': DateTime.now().toString(), // Temporary ID
          ...result,
          'status': 'active',
        });
      });
    }
  }

  void _showEditUserDialog(Map<String, dynamic> user) {
    // TODO: Implement edit user dialog
  }

  void _showDeleteConfirmation(Map<String, dynamic> user) {
    // TODO: Implement delete confirmation dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('User Management'),
      ),
      body: SafeArea(
        child: Column(
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
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'user_management_fab',
        onPressed: showAddUserDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
