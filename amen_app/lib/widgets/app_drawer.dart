import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1DE9B6), Color(0xFF0288D1)],
          ),
        ),
        child: Column(
          children: [
            // Profile Section
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Color(0xFF0288D1)),
              ),
              accountName: const Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                'john.doe@example.com',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            // Menu Items
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Profile',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.comment_outlined,
                      title: 'Commentary',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_outlined,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.front_hand_outlined,
                      title: 'My Prayer Requests',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.check_circle_outline,
                      title: 'My Completed Devotions',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.book_outlined,
                      title: 'Saved Notes',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.event_outlined,
                      title: 'Joined Events',
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.language,
                      title: 'Language Selector',
                      onTap: () {},
                    ),
                    _buildSwitchMenuItem(
                      icon: Icons.dark_mode_outlined,
                      title: 'Dark Mode',
                      value: false,
                      onChanged: (bool value) {},
                    ),
                    const Divider(),
                    _buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        final authService = Provider.of<AuthService>(
                          context,
                          listen: false,
                        );
                        authService.logout().then((_) {
                          Navigator.pushReplacementNamed(context, '/login');
                        });
                      },
                      textColor: Colors.red,
                      iconColor: Colors.red,
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? const Color(0xFF0288D1),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchMenuItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(
        icon,
        color: const Color(0xFF0288D1),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: const Color(0xFF0288D1),
    );
  }
}
