import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/services/auth_service.dart';
import '../../../shared/services/theme_service.dart';
import '../../../core/localization/app_localizations.dart';
import 'prayer_requests_screen.dart';
import 'completed_devotions_screen.dart';
import 'saved_notes_screen.dart';
import 'settings_screens.dart';
import 'joined_events_screen.dart';
import 'notifications_screen.dart';
import 'language_screen.dart';
import 'theme_screen.dart';
import 'attendance_screen.dart';

class ProfileScreen extends StatelessWidget {
  final bool isTab;
  const ProfileScreen({Key? key, this.isTab = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileContent(isTab: isTab);
  }
}

class ProfileContent extends StatelessWidget {
  final bool isTab;
  const ProfileContent({Key? key, this.isTab = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final localizations = AppLocalizations.of(context);

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
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
              ),
              title: Text(localizations.profile),
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
                              title: Text(localizations.takePhoto),
                              onTap: () {
                                Navigator.pop(context);
                                // Handle camera
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: Text(localizations.chooseFromGallery),
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
                          backgroundImage:
                              AssetImage('assets/images/profiles/jo.jpg'),
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
                    'Jo',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@jo_username',
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
                    child: Text(localizations.editProfile),
                  ),
                ],
              ),
            ),
            // Profile Menu Items
            _buildSection(
              title: localizations.spiritualJourney,
              children: [
                _buildMenuItem(
                  icon: Icons.front_hand,
                  title: localizations.myPrayers,
                  subtitle: localizations.viewTrackPrayers,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrayerRequestsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.check_circle_outline,
                  title: localizations.completedDevotions,
                  subtitle: localizations.trackDevotionProgress,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompletedDevotionsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.calendar_today_outlined,
                  title: localizations.attendance,
                  subtitle: localizations.trackChurchAttendance,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AttendanceScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.book_outlined,
                  title: localizations.savedNotes,
                  subtitle: localizations.accessSermonNotes,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SavedNotesScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.event_outlined,
                  title: localizations.joinedEvents,
                  subtitle: localizations.viewUpcomingEvents,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinedEventsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildSection(
              title: localizations.appSettings,
              children: [
                _buildMenuItem(
                  icon: Icons.notifications_outlined,
                  title: localizations.notifications,
                  subtitle: localizations.manageReminders,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.language,
                  title: localizations.language,
                  subtitle: localizations.switchLanguage,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LanguageScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.dark_mode_outlined,
                  title: localizations.theme,
                  subtitle: localizations.changeAppTheme,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemeScreen(),
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: localizations.appSettings,
                  subtitle: localizations.appPreferences,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppSettingsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildMenuItem(
              icon: Icons.logout,
              title: localizations.logout,
              subtitle: localizations.signOut,
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

  Widget _buildSwitchMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
