import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/services/auth_service.dart';
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
                  'Welcome to Admin Dashboard',
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
                '1,234',
                Icons.people,
                Colors.blue,
              ),
              _buildStatCard(
                context,
                'Active Users',
                '789',
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
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
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
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
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
    const ContentManagement(),
    const EventManagement(),
    const PrayerModeration(),
    const CommentaryModeration(),
    const NotificationControl(),
    const FeedbackManagement(),
    const AppSettings(),
    const AnalyticsDashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final authService =
                  Provider.of<AuthService>(context, listen: false);
              await authService.logout();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      drawer: AdminDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.pop(context); // Close drawer
        },
      ),
      body: _screens[_selectedIndex],
    );
  }
}
