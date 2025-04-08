import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../services/theme_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [Colors.grey[900]!, Colors.grey[800]!]
                : [const Color(0xFF1DE9B6), const Color(0xFF0288D1)],
          ),
        ),
        child: Column(
          children: [
            // Profile Section
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: theme.colorScheme.surface,
                child: Icon(Icons.person,
                    size: 50, color: theme.colorScheme.primary),
              ),
              accountName: Text(
                'John Doe',
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'john.doe@example.com',
                style: TextStyle(
                    color: theme.colorScheme.onPrimary.withOpacity(0.7)),
              ),
            ),
            // Menu Items
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildMenuItem(
                      context,
                      icon: Icons.person_outline,
                      title: 'Profile',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.comment_outlined,
                      title: 'Commentary',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.notifications_outlined,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.front_hand_outlined,
                      title: 'My Prayer Requests',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.check_circle_outline,
                      title: 'My Completed Devotions',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.book_outlined,
                      title: 'Saved Notes',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.event_outlined,
                      title: 'Joined Events',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      context,
                      icon: Icons.language,
                      title: 'Language Selector',
                      onTap: () {},
                    ),
                    _buildSwitchMenuItem(
                      context,
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      value: Provider.of<ThemeService>(context).isDarkMode,
                      onChanged: (bool value) {
                        Provider.of<ThemeService>(context, listen: false)
                            .toggleTheme();
                      },
                    ),
                    const Divider(),
                    _buildMenuItem(
                      context,
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        authService.logout().then((_) {
                          Navigator.pushReplacementNamed(context, '/login');
                        });
                      },
                      textColor: theme.colorScheme.error,
                      iconColor: theme.colorScheme.error,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? theme.colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final theme = Theme.of(context);
    return SwitchListTile(
      secondary: Icon(
        icon,
        color: theme.colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: theme.colorScheme.primary,
    );
  }
}
