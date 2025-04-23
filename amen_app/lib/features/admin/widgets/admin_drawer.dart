import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/services/auth_service.dart';
import '../../../shared/services/theme_service.dart';

class AdminDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AdminDrawer({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final themeService = Provider.of<ThemeService>(context);

    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Admin Panel',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Manage Church Community',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.people,
                    title: 'User Management',
                    index: 1,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.book,
                    title: 'Content Management',
                    index: 2,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.event,
                    title: 'Event Management',
                    index: 3,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.person_pin_circle,
                    title: 'Prayer Moderation',
                    index: 4,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.comment,
                    title: 'Commentary Moderation',
                    index: 5,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.notifications,
                    title: 'Notification Control',
                    index: 6,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.feedback,
                    title: 'Feedback Management',
                    index: 7,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings,
                    title: 'App Settings',
                    index: 8,
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.analytics,
                    title: 'Analytics Dashboard',
                    index: 9,
                  ),
                  const Divider(),
                  _buildDarkModeSwitch(context, isDark, themeService),
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
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    int? index,
    VoidCallback? onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    final theme = Theme.of(context);
    final isSelected = index != null && index == selectedIndex;

    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? theme.colorScheme.onSurface,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? theme.colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 20,
      ),
      selected: isSelected,
      onTap: () {
        if (index != null) {
          onItemSelected(index);
          Navigator.pop(context);
        } else if (onTap != null) {
          onTap();
        }
      },
    );
  }

  Widget _buildDarkModeSwitch(
    BuildContext context,
    bool isDark,
    ThemeService themeService,
  ) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: isDark,
      onChanged: (value) {
        themeService.setTheme(
          value ? ThemeType.night : ThemeType.day,
        );
      },
    );
  }
}
