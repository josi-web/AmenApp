import 'package:flutter/material.dart';
import '../widgets/admin_drawer.dart';
import 'user_management.dart';
import 'content_management.dart';
import 'event_management.dart';
import 'prayer_moderation.dart';
import 'analytics_dashboard.dart';
import 'commentary_moderation.dart';
import 'notification_control.dart';
import 'feedback_management.dart';
import 'app_settings.dart';
import 'admin_chat_screen.dart';
import 'admin_books_screen.dart';
import 'admin_profile_screen.dart';

class AdminHomeContent extends StatelessWidget {
  const AdminHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Bs Admin Dashboard',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage your app content and users efficiently',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Quick Stats
          Text(
            'Quick Stats',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: [
              _buildStatCard(
                context,
                'Total Users',
                '241',
                Icons.people,
                Colors.blue,
              ),
              _buildStatCard(
                context,
                'Active Users',
                '134',
                Icons.people_alt,
                Colors.green,
              ),
              _buildStatCard(
                context,
                'Prayer Requests',
                '56',
                Icons.person_pin_circle,
                Colors.orange,
              ),
              _buildStatCard(
                context,
                'Events',
                '12',
                Icons.event,
                Colors.purple,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Quick Actions
          Text(
            'Quick Actions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
            children: [
              _buildActionButton(
                context,
                'Manage Users',
                Icons.people,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserManagement(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                context,
                'Manage Content',
                Icons.article,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContentManagement(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                context,
                'Moderate Prayers',
                Icons.person_pin_circle,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrayerModeration(),
                    ),
                  );
                },
              ),
              _buildActionButton(
                context,
                'View Analytics',
                Icons.analytics,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalyticsDashboard(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 28, color: Theme.of(context).primaryColor),
              const SizedBox(height: 4),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 14,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AdminHomeContent(),
    const UserManagement(),
    const AdminChatScreen(),
    const ContentManagement(),
    const EventManagement(),
    const PrayerModeration(),
    const CommentaryModeration(),
    const NotificationControl(),
    const FeedbackManagement(),
    const AppSettings(),
    const AnalyticsDashboard(),
    const AdminBooksScreen(),
    const AdminProfileScreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getScreenTitle()),
        actions: _getAppBarActions(),
      ),
      drawer: AdminDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      body: _screens[_selectedIndex],
      floatingActionButton: _getFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getBottomNavIndex(_selectedIndex),
        onTap: (index) {
          setState(() {
            _selectedIndex = _getScreenIndexFromBottomNav(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _getScreenTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Admin Dashboard';
      case 1:
        return 'User Management';
      case 2:
        return 'Admin Chat';
      case 3:
        return 'Content Management';
      case 4:
        return 'Event Management';
      case 5:
        return 'Prayer Moderation';
      case 6:
        return 'Commentary Moderation';
      case 7:
        return 'Notification Control';
      case 8:
        return 'Feedback Management';
      case 9:
        return 'App Settings';
      case 10:
        return 'Analytics Dashboard';
      case 11:
        return 'Books';
      case 12:
        return 'Profile';
      default:
        return 'Admin Dashboard';
    }
  }

  List<Widget> _getAppBarActions() {
    switch (_selectedIndex) {
      case 1: // User Management
        return [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final userManagement = UserManagement.of(context);
              if (userManagement != null) {
                userManagement.refreshUsers();
              }
            },
          ),
        ];
      case 2: // Chat
        return [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle chat search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle chat filter
            },
          ),
        ];
      case 11: // Books
        return [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle book search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle book filter
            },
          ),
        ];
      case 12: // Profile
        return [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle profile settings
            },
          ),
        ];
      default:
        return [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile
            },
          ),
        ];
    }
  }

  Widget? _getFloatingActionButton() {
    switch (_selectedIndex) {
      case 1: // User Management
        return FloatingActionButton(
          heroTag: 'admin_add_user',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserManagement(),
              ),
            );
          },
          child: const Icon(Icons.add),
        );
      case 2: // Chat
        return FloatingActionButton(
          heroTag: 'admin_new_chat',
          onPressed: () {
            // Show dialog to create new chat or group
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('New Chat'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_add),
                      title: const Text('New User Chat'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to user selection
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.group_add),
                      title: const Text('New Group'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to group creation
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        );
      case 11: // Books
        return FloatingActionButton(
          heroTag: 'admin_add_book',
          onPressed: () {
            // Show dialog to add new book
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Add New Book'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_circle),
                      title: const Text('Add Book Manually'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to add book form
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.upload_file),
                      title: const Text('Import from CSV'),
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to import books
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        );
      default:
        return null;
    }
  }

  // Helper method to convert screen index to bottom nav index
  int _getBottomNavIndex(int screenIndex) {
    switch (screenIndex) {
      case 0: // Home
        return 0;
      case 2: // Chat
        return 1;
      case 11: // Books (new)
        return 2;
      case 12: // Profile (new)
        return 3;
      default:
        return 0;
    }
  }

  // Helper method to convert bottom nav index to screen index
  int _getScreenIndexFromBottomNav(int bottomNavIndex) {
    switch (bottomNavIndex) {
      case 0:
        return 0; // Home
      case 1:
        return 2; // Chat
      case 2:
        return 11; // Books
      case 3:
        return 12; // Profile
      default:
        return 0;
    }
  }
}
