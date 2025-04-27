import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/services/auth_service.dart';
import '../../../shared/services/theme_service.dart';
import 'user_management.dart';
import 'content_management.dart';
import 'event_management.dart';
import 'prayer_moderation.dart';
import 'commentary_moderation.dart';
import 'notification_control.dart';
import 'feedback_management.dart';
import 'app_settings.dart';
import 'analytics_dashboard.dart';

class AdminProfileScreen extends StatelessWidget {
  final bool isTab;
  const AdminProfileScreen({Key? key, this.isTab = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminProfileContent(isTab: isTab);
  }
}

class AdminProfileContent extends StatelessWidget {
  final bool isTab;
  const AdminProfileContent({Key? key, this.isTab = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return Scaffold(
      appBar: isTab
          ? null
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/admin');
                  }
                },
              ),
              title: const Text('Admin Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Handle app settings
                  },
                ),
              ],
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle profile picture change
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt),
                              title: const Text('Take Photo'),
                              onTap: () {
                                Navigator.pop(context);
                                // Handle camera
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Choose from Gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                // Handle gallery selection
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/profiles/user1.png.jpg'),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'admin@amenapp.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle edit profile
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            ),
            // Admin Stats
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Admin Statistics',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(context, 'Users', '1,234'),
                      _buildStatItem(context, 'Content', '56'),
                      _buildStatItem(context, 'Events', '12'),
                    ],
                  ),
                ],
              ),
            ),
            // Admin Menu Items
            _buildSection(
              title: 'User Management',
              children: [
                _buildMenuItem(
                  icon: Icons.people,
                  title: 'User Management',
                  subtitle: 'Manage user accounts and permissions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserManagement(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.person_pin_circle,
                  title: 'Prayer Moderation',
                  subtitle: 'Moderate prayer requests',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrayerModeration(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.comment,
                  title: 'Commentary Moderation',
                  subtitle: 'Moderate user comments',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CommentaryModeration(),
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildSection(
              title: 'Content Management',
              children: [
                _buildMenuItem(
                  icon: Icons.book,
                  title: 'Content Management',
                  subtitle: 'Manage app content and resources',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContentManagement(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.event,
                  title: 'Event Management',
                  subtitle: 'Create and manage church events',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EventManagement(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  title: 'Notification Control',
                  subtitle: 'Send and manage notifications',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationControl(),
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildSection(
              title: 'App Settings',
              children: [
                _buildMenuItem(
                  icon: Icons.feedback,
                  title: 'Feedback Management',
                  subtitle: 'View and respond to user feedback',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackManagement(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'App Settings',
                  subtitle: 'Configure app settings and preferences',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppSettings(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.analytics,
                  title: 'Analytics Dashboard',
                  subtitle: 'View app usage statistics',
                  onTap: () {
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
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Log out',
              subtitle: 'Sign out of your admin account',
              onTap: () {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                authService.logout().then((_) {
                  Navigator.pushReplacementNamed(context, '/login');
                });
              },
              textColor: Colors.red,
              iconColor: Colors.red,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSection({
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
