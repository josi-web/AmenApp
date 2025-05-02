import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  final Locale locale;
  static const String LANGUAGE_CODE = 'languageCode';

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // App General
      'app_name': 'Amen App',
      'settings': 'Settings',
      'language': 'Language',
      'theme': 'Theme',
      'notifications': 'Notifications',
      'profile': 'Profile',
      'bible': 'Bible',
      'prayers': 'Prayers',
      'about': 'About',
      'logout': 'Logout',
      'cancel': 'Cancel',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'add': 'Add',
      'search': 'Search',
      'filter': 'Filter',
      'refresh': 'Refresh',
      'loading': 'Loading...',

      // Navigation
      'home': 'Home',
      'chat': 'Chat',
      'books': 'Books',
      'commentary': 'Commentary',
      'language_selector': 'Language Selector',

      // Auth Screens
      'welcome_back': 'Welcome Back',
      'create_account': 'Create Account',
      'email': 'Email',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'forgot_password': 'Forgot Password?',
      'login': 'Login',
      'register': 'Register',
      'dont_have_account': 'Don\'t have an account?',
      'already_have_account': 'Already have an account?',
      'sign_up': 'Sign Up',
      'sign_in': 'Sign In',

      // Home Screen
      'bible_study': 'BIBLE STUDY',
      'verse_of_day': 'Verse of the day',
      'focus_for_month': 'Focus for the Month',
      'daily_devotion': 'Daily Devotion',
      'prayer_requests': 'Prayer Requests',
      'events': 'Events',
      'bible_study_schedule': 'Bible Study Schedule',
      'read_bible': 'Read Bible',
      'holiness': 'Holiness',

      // Settings
      'app_settings': 'App Settings',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
      'system_theme': 'System Theme',
      'language_settings': 'Language Settings',
      'notification_settings': 'Notification Settings',
      'sound_settings': 'Sound Settings',
      'font_size': 'Font Size',
      'verse_version': 'Verse Version',
      'english': 'English',
      'amharic': 'Amharic',

      // Profile
      'edit_profile': 'Edit Profile',
      'my_prayers': 'My Prayers',
      'saved_notes': 'Saved Notes',
      'joined_events': 'Joined Events',
      'completed_devotions': 'Completed Devotions',
      'achievements': 'Achievements',
      'attendance': 'Attendance',
      'spiritual_journey': 'Spiritual Journey',
      'view_track_prayers': 'View and track your prayers',
      'track_devotion_progress': 'Track your daily devotional progress',
      'track_church_attendance': 'Track your church attendance',
      'access_sermon_notes': 'Access your sermon and study notes',
      'view_upcoming_events': 'View your upcoming events',
      'manage_reminders': 'Manage your reminders',
      'switch_language': 'Switch between Amharic and English',
      'change_app_theme': 'Change app theme',
      'app_preferences': 'Sound, font size, verse version',
      'sign_out': 'Sign out of your account',
      'take_photo': 'Take Photo',
      'choose_from_gallery': 'Choose from Gallery',

      // Admin Dashboard
      'admin_dashboard': 'Admin Dashboard',
      'welcome_admin': 'Welcome to Bs Admin Dashboard',
      'manage_efficiently': 'Manage your app content and users efficiently',
      'quick_stats': 'Quick Stats',
      'user_management': 'User Management',
      'content_management': 'Content Management',
      'event_management': 'Event Management',
      'prayer_moderation': 'Prayer Moderation',
      'commentary_moderation': 'Commentary Moderation',
      'notification_control': 'Notification Control',
      'feedback_management': 'Feedback Management',
      'analytics_dashboard': 'Analytics Dashboard',

      // Books
      'soulful_bookshelf': 'Soulful Bookshelf',
      'feed_your_soul': 'Feed Your Soul with the wisdom of the Bible.',
      'read_now': 'Read Now',
      'book_management': 'Book Management',
      'manage_books': 'Manage and approve books for your community.',
      'add_new': 'Add New',
      'author': 'Author',
      'category': 'Category',

      // Content Management
      'verses_of_day': 'Verses of the Day',
      'commentaries': 'Commentaries',
      'devotionals': 'Devotionals',
      'add_verse': 'Add Verse',
      'add_commentary': 'Add Commentary',
      'add_devotional': 'Add Devotional',
      'title': 'Title',
      'content': 'Content',
      'reference': 'Reference',

      // Notifications
      'announcement': 'Announcement',
      'devotion_reminder': 'Daily Devotion Reminder',
      'prayer_reminder': 'Prayer Time Reminder',
      'notification_type': 'Notification Type',
      'message': 'Message',

      // Prayer Requests
      'my_prayer_requests': 'My Prayer Requests',
      'add_prayer_request': 'Add Prayer Request',
      'prayer_title': 'Prayer Title',
      'prayer_description': 'Prayer Description',
      'prayer_category': 'Prayer Category',

      // Completed Devotions
      'current_streak': 'Current Streak',
      'your_progress': 'Your Progress',
      'days': 'days',

      // Notes
      'sermon_notes': 'Sermon Notes',
      'bible_study_notes': 'Bible Study Notes',
      'prayer_notes': 'Prayer Notes',
      'add_note': 'Add Note',
      'note_title': 'Note Title',
      'note_content': 'Note Content',
    },
    'am': {
      // App General
      'app_name': 'አሜን መተግበሪያ',
      'settings': 'ቅንብሮች',
      'language': 'ቋንቋ',
      'theme': 'ገጽታ',
      'notifications': 'ማሳወቂያዎች',
      'profile': 'መገለጫ',
      'bible': 'መጽሐፍ ቅዱስ',
      'prayers': 'ጸሎቶች',
      'about': 'ስለ',
      'logout': 'ውጣ',
      'cancel': 'ሰርዝ',
      'save': 'አስቀምጥ',
      'delete': 'ሰርዝ',
      'edit': 'አስተካክል',
      'add': 'ጨምር',
      'search': 'ፈልግ',
      'filter': 'አጣራ',
      'refresh': 'አድስ',
      'loading': 'በመጫን ላይ...',

      // Navigation
      'home': 'መነሻ',
      'chat': 'ውይይት',
      'books': 'መጽሐፍት',
      'commentary': 'ማብራሪያ',
      'language_selector': 'የቋንቋ መምረጫ',

      // Auth Screens
      'welcome_back': 'እንኳን በደህና ተመለሱ',
      'create_account': 'አካውንት ፍጠር',
      'email': 'ኢሜይል',
      'password': 'የይለፍ ቃል',
      'confirm_password': 'የይለፍ ቃል አረጋግጥ',
      'forgot_password': 'የይለፍ ቃል ረሳህ?',
      'login': 'ግባ',
      'register': 'ተመዝገብ',
      'dont_have_account': 'አካውንት የለህም?',
      'already_have_account': 'አካውንት አለህ?',
      'sign_up': 'ተመዝገብ',
      'sign_in': 'ግባ',

      // Home Screen
      'bible_study': 'የመጽሐፍ ቅዱስ ጥናት',
      'verse_of_day': 'የዕለቱ ጥቅስ',
      'focus_for_month': 'የወሩ ትኩረት',
      'daily_devotion': 'የዕለት ተዕለት እንክብካቤ',
      'prayer_requests': 'የጸሎት ጥያቄዎች',
      'events': 'ዝግጅቶች',
      'bible_study_schedule': 'የመጽሐፍ ቅዱስ ጥናት መርሃ ግብር',
      'read_bible': 'መጽሐፍ ቅዱስ አንብብ',
      'holiness': 'ቅድስና',

      // Settings
      'app_settings': 'የመተግበሪያ ቅንብሮች',
      'dark_mode': 'ጨለማ ሁነታ',
      'light_mode': 'ብርሃን ሁነታ',
      'system_theme': 'የስርዓት ገጽታ',
      'language_settings': 'የቋንቋ ቅንብሮች',
      'notification_settings': 'የማሳወቂያ ቅንብሮች',
      'sound_settings': 'የድምጽ ቅንብሮች',
      'font_size': 'የፊደል መጠን',
      'verse_version': 'የጥቅስ ስሪት',
      'english': 'እንግሊዝኛ',
      'amharic': 'አማርኛ',

      // Profile
      'edit_profile': 'መገለጫ አስተካክል',
      'my_prayers': 'ጸሎቶቼ',
      'saved_notes': 'የተቀመጡ ማስታወሻዎች',
      'joined_events': 'የተቀላቀልኳቸው ዝግጅቶች',
      'completed_devotions': 'የተጠናቀቁ እንክብካቤዎች',
      'attendance': 'ተሳትፎ',
      'achievements': 'ስኬቶች',
      'spiritual_journey': 'መንፈሳዊ ጉዞ',
      'view_track_prayers': 'ጸሎቶችን ይመልከቱ እና ይከታተሉ',
      'track_devotion_progress': 'የእለት ተእለት መንፈሳዊ እንክብካቤ እድገትዎን ይከታተሉ',
      'track_church_attendance': 'የቤተክርስቲያን ተሳትፎዎን ይከታተሉ',
      'access_sermon_notes': 'የስብከት እና የጥናት ማስታወሻዎችን ይመልከቱ',
      'view_upcoming_events': 'መጪ ዝግጅቶችን ይመልከቱ',
      'manage_reminders': 'ማስታወሻዎችን ያስተዳድሩ',
      'switch_language': 'በአማርኛ እና እንግሊዝኛ መካከል ይቀይሩ',
      'change_app_theme': 'የመተግበሪያ ገጽታ ይቀይሩ',
      'app_preferences': 'ድምጽ፣ የጽሑፍ መጠን፣ የጥቅስ ስሪት',
      'sign_out': 'ከመለያዎ ይውጡ',
      'take_photo': 'ፎቶ አንሳ',
      'choose_from_gallery': 'ከጋለሪ ይምረጡ',

      // Admin Dashboard
      'admin_dashboard': 'የአስተዳዳሪ ዳሽቦርድ',
      'welcome_admin': 'እንኳን ወደ Bs አስተዳዳሪ ዳሽቦርድ በደህና መጡ',
      'manage_efficiently': 'የመተግበሪያዎን ይዘትና ተጠቃሚዎች በብቃት ያስተዳድሩ',
      'quick_stats': 'ፈጣን ስታቲስቲክስ',
      'user_management': 'የተጠቃሚ አስተዳደር',
      'content_management': 'የይዘት አስተዳደር',
      'event_management': 'የዝግጅት አስተዳደር',
      'prayer_moderation': 'የጸሎት ማጣሪያ',
      'commentary_moderation': 'የአስተያየት ማጣሪያ',
      'notification_control': 'የማሳወቂያ ቁጥጥር',
      'feedback_management': 'የግብረመልስ አስተዳደር',
      'analytics_dashboard': 'የትንታኔ ዳሽቦርድ',

      // Books
      'soulful_bookshelf': 'መንፈሳዊ መጽሐፍት',
      'feed_your_soul': 'ነፍስህን በመጽሐፍ ቅዱስ ጥበብ መግብ',
      'read_now': 'አሁን አንብብ',
      'book_management': 'የመጽሐፍት አስተዳደር',
      'manage_books': 'ለማህበረሰብዎ መጽሐፍትን ያስተዳድሩ እና ያጸድቁ',
      'add_new': 'አዲስ ጨምር',
      'author': 'ደራሲ',
      'category': 'ምድብ',

      // Content Management
      'verses_of_day': 'የዕለቱ ጥቅሶች',
      'commentaries': 'ማብራሪያዎች',
      'devotionals': 'የእለት ተእለት እንክብካቤዎች',
      'add_verse': 'ጥቅስ ጨምር',
      'add_commentary': 'ማብራሪያ ጨምር',
      'add_devotional': 'እንክብካቤ ጨምር',
      'title': 'ርዕስ',
      'content': 'ይዘት',
      'reference': 'ማጣቀሻ',

      // Notifications
      'announcement': 'ማስታወቂያ',
      'devotion_reminder': 'የዕለት ተዕለት እንክብካቤ ማስታወሻ',
      'prayer_reminder': 'የጸሎት ሰዓት ማስታወሻ',
      'notification_type': 'የማሳወቂያ አይነት',
      'message': 'መልእክት',

      // Prayer Requests
      'my_prayer_requests': 'የጸሎት ጥያቄዎቼ',
      'add_prayer_request': 'የጸሎት ጥያቄ ጨምር',
      'prayer_title': 'የጸሎት ርዕስ',
      'prayer_description': 'የጸሎት መግለጫ',
      'prayer_category': 'የጸሎት ምድብ',

      // Completed Devotions
      'current_streak': 'የአሁኑ ተከታታይ',
      'your_progress': 'እድገትህ',
      'days': 'ቀናት',

      // Notes
      'sermon_notes': 'የስብከት ማስታወሻዎች',
      'bible_study_notes': 'የመጽሐፍ ቅዱስ ጥናት ማስታወሻዎች',
      'prayer_notes': 'የጸሎት ማስታወሻዎች',
      'add_note': 'ማስታወሻ ጨምር',
      'note_title': 'የማስታወሻ ርዕስ',
      'note_content': 'የማስታወሻ ይዘት',
    },
  };

  // Getters for all translations
  String get appName => _localizedValues[locale.languageCode]!['app_name']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get theme => _localizedValues[locale.languageCode]!['theme']!;
  String get notifications =>
      _localizedValues[locale.languageCode]!['notifications']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get bible => _localizedValues[locale.languageCode]!['bible']!;
  String get prayers => _localizedValues[locale.languageCode]!['prayers']!;
  String get about => _localizedValues[locale.languageCode]!['about']!;
  String get logout => _localizedValues[locale.languageCode]!['logout']!;
  String get cancel => _localizedValues[locale.languageCode]!['cancel']!;
  String get save => _localizedValues[locale.languageCode]!['save']!;
  String get delete => _localizedValues[locale.languageCode]!['delete']!;
  String get edit => _localizedValues[locale.languageCode]!['edit']!;
  String get add => _localizedValues[locale.languageCode]!['add']!;
  String get search => _localizedValues[locale.languageCode]!['search']!;
  String get filter => _localizedValues[locale.languageCode]!['filter']!;
  String get refresh => _localizedValues[locale.languageCode]!['refresh']!;
  String get loading => _localizedValues[locale.languageCode]!['loading']!;

  // Auth Screen Getters
  String get welcomeBack =>
      _localizedValues[locale.languageCode]!['welcome_back']!;
  String get createAccount =>
      _localizedValues[locale.languageCode]!['create_account']!;
  String get email => _localizedValues[locale.languageCode]!['email']!;
  String get password => _localizedValues[locale.languageCode]!['password']!;
  String get confirmPassword =>
      _localizedValues[locale.languageCode]!['confirm_password']!;
  String get forgotPassword =>
      _localizedValues[locale.languageCode]!['forgot_password']!;
  String get login => _localizedValues[locale.languageCode]!['login']!;
  String get register => _localizedValues[locale.languageCode]!['register']!;
  String get dontHaveAccount =>
      _localizedValues[locale.languageCode]!['dont_have_account']!;
  String get alreadyHaveAccount =>
      _localizedValues[locale.languageCode]!['already_have_account']!;
  String get signUp => _localizedValues[locale.languageCode]!['sign_up']!;
  String get signIn => _localizedValues[locale.languageCode]!['sign_in']!;

  // Home Screen Getters
  String get bibleStudy =>
      _localizedValues[locale.languageCode]!['bible_study']!;
  String get verseOfDay =>
      _localizedValues[locale.languageCode]!['verse_of_day']!;
  String get focusForMonth =>
      _localizedValues[locale.languageCode]!['focus_for_month']!;
  String get dailyDevotion =>
      _localizedValues[locale.languageCode]!['daily_devotion']!;
  String get prayerRequests =>
      _localizedValues[locale.languageCode]!['prayer_requests']!;
  String get events => _localizedValues[locale.languageCode]!['events']!;
  String get books => _localizedValues[locale.languageCode]!['books']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get chat => _localizedValues[locale.languageCode]!['chat']!;
  String get bibleStudySchedule =>
      _localizedValues[locale.languageCode]!['bible_study_schedule']!;
  String get readBible => _localizedValues[locale.languageCode]!['read_bible']!;
  String get holiness => _localizedValues[locale.languageCode]!['holiness']!;
  String get languageSelector =>
      _localizedValues[locale.languageCode]!['language_selector']!;
  String get commentary =>
      _localizedValues[locale.languageCode]!['commentary']!;

  // Settings Getters
  String get appSettings =>
      _localizedValues[locale.languageCode]!['app_settings']!;
  String get darkMode => _localizedValues[locale.languageCode]!['dark_mode']!;
  String get lightMode => _localizedValues[locale.languageCode]!['light_mode']!;
  String get systemTheme =>
      _localizedValues[locale.languageCode]!['system_theme']!;
  String get languageSettings =>
      _localizedValues[locale.languageCode]!['language_settings']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get amharic => _localizedValues[locale.languageCode]!['amharic']!;
  String get notificationSettings =>
      _localizedValues[locale.languageCode]!['notification_settings']!;
  String get soundSettings =>
      _localizedValues[locale.languageCode]!['sound_settings']!;
  String get fontSize => _localizedValues[locale.languageCode]!['font_size']!;
  String get verseVersion =>
      _localizedValues[locale.languageCode]!['verse_version']!;

  // Profile Getters
  String get editProfile =>
      _localizedValues[locale.languageCode]!['edit_profile']!;
  String get myPrayers => _localizedValues[locale.languageCode]!['my_prayers']!;
  String get savedNotes =>
      _localizedValues[locale.languageCode]!['saved_notes']!;
  String get joinedEvents =>
      _localizedValues[locale.languageCode]!['joined_events']!;
  String get completedDevotions =>
      _localizedValues[locale.languageCode]!['completed_devotions']!;
  String get attendance =>
      _localizedValues[locale.languageCode]!['attendance']!;
  String get achievements =>
      _localizedValues[locale.languageCode]!['achievements']!;
  String get spiritualJourney =>
      _localizedValues[locale.languageCode]!['spiritual_journey']!;
  String get viewTrackPrayers =>
      _localizedValues[locale.languageCode]!['view_track_prayers']!;
  String get trackDevotionProgress =>
      _localizedValues[locale.languageCode]!['track_devotion_progress']!;
  String get trackChurchAttendance =>
      _localizedValues[locale.languageCode]!['track_church_attendance']!;
  String get accessSermonNotes =>
      _localizedValues[locale.languageCode]!['access_sermon_notes']!;
  String get viewUpcomingEvents =>
      _localizedValues[locale.languageCode]!['view_upcoming_events']!;
  String get manageReminders =>
      _localizedValues[locale.languageCode]!['manage_reminders']!;
  String get switchLanguage =>
      _localizedValues[locale.languageCode]!['switch_language']!;
  String get changeAppTheme =>
      _localizedValues[locale.languageCode]!['change_app_theme']!;
  String get appPreferences =>
      _localizedValues[locale.languageCode]!['app_preferences']!;
  String get signOut => _localizedValues[locale.languageCode]!['sign_out']!;
  String get takePhoto => _localizedValues[locale.languageCode]!['take_photo']!;
  String get chooseFromGallery =>
      _localizedValues[locale.languageCode]!['choose_from_gallery']!;

  // Admin Dashboard Getters
  String get adminDashboard =>
      _localizedValues[locale.languageCode]!['admin_dashboard']!;
  String get welcomeAdmin =>
      _localizedValues[locale.languageCode]!['welcome_admin']!;
  String get manageEfficiently =>
      _localizedValues[locale.languageCode]!['manage_efficiently']!;
  String get quickStats =>
      _localizedValues[locale.languageCode]!['quick_stats']!;
  String get userManagement =>
      _localizedValues[locale.languageCode]!['user_management']!;
  String get contentManagement =>
      _localizedValues[locale.languageCode]!['content_management']!;
  String get eventManagement =>
      _localizedValues[locale.languageCode]!['event_management']!;
  String get prayerModeration =>
      _localizedValues[locale.languageCode]!['prayer_moderation']!;
  String get commentaryModeration =>
      _localizedValues[locale.languageCode]!['commentary_moderation']!;
  String get notificationControl =>
      _localizedValues[locale.languageCode]!['notification_control']!;
  String get feedbackManagement =>
      _localizedValues[locale.languageCode]!['feedback_management']!;
  String get analyticsDashboard =>
      _localizedValues[locale.languageCode]!['analytics_dashboard']!;

  // Books Getters
  String get soulfulBookshelf =>
      _localizedValues[locale.languageCode]!['soulful_bookshelf']!;
  String get feedYourSoul =>
      _localizedValues[locale.languageCode]!['feed_your_soul']!;
  String get readNow => _localizedValues[locale.languageCode]!['read_now']!;
  String get bookManagement =>
      _localizedValues[locale.languageCode]!['book_management']!;
  String get manageBooks =>
      _localizedValues[locale.languageCode]!['manage_books']!;
  String get addNew => _localizedValues[locale.languageCode]!['add_new']!;
  String get author => _localizedValues[locale.languageCode]!['author']!;
  String get category => _localizedValues[locale.languageCode]!['category']!;

  // Content Management Getters
  String get versesOfDay =>
      _localizedValues[locale.languageCode]!['verses_of_day']!;
  String get commentaries =>
      _localizedValues[locale.languageCode]!['commentaries']!;
  String get devotionals =>
      _localizedValues[locale.languageCode]!['devotionals']!;
  String get addVerse => _localizedValues[locale.languageCode]!['add_verse']!;
  String get addCommentary =>
      _localizedValues[locale.languageCode]!['add_commentary']!;
  String get addDevotional =>
      _localizedValues[locale.languageCode]!['add_devotional']!;
  String get title => _localizedValues[locale.languageCode]!['title']!;
  String get content => _localizedValues[locale.languageCode]!['content']!;
  String get reference => _localizedValues[locale.languageCode]!['reference']!;

  // Notifications Getters
  String get announcement =>
      _localizedValues[locale.languageCode]!['announcement']!;
  String get devotionReminder =>
      _localizedValues[locale.languageCode]!['devotion_reminder']!;
  String get prayerReminder =>
      _localizedValues[locale.languageCode]!['prayer_reminder']!;
  String get notificationType =>
      _localizedValues[locale.languageCode]!['notification_type']!;
  String get message => _localizedValues[locale.languageCode]!['message']!;

  // Prayer Requests Getters
  String get myPrayerRequests =>
      _localizedValues[locale.languageCode]!['my_prayer_requests']!;
  String get addPrayerRequest =>
      _localizedValues[locale.languageCode]!['add_prayer_request']!;
  String get prayerTitle =>
      _localizedValues[locale.languageCode]!['prayer_title']!;
  String get prayerDescription =>
      _localizedValues[locale.languageCode]!['prayer_description']!;
  String get prayerCategory =>
      _localizedValues[locale.languageCode]!['prayer_category']!;

  // Completed Devotions Getters
  String get currentStreak =>
      _localizedValues[locale.languageCode]!['current_streak']!;
  String get yourProgress =>
      _localizedValues[locale.languageCode]!['your_progress']!;
  String get days => _localizedValues[locale.languageCode]!['days']!;

  // Notes Getters
  String get sermonNotes =>
      _localizedValues[locale.languageCode]!['sermon_notes']!;
  String get bibleStudyNotes =>
      _localizedValues[locale.languageCode]!['bible_study_notes']!;
  String get prayerNotes =>
      _localizedValues[locale.languageCode]!['prayer_notes']!;
  String get addNote => _localizedValues[locale.languageCode]!['add_note']!;
  String get noteTitle => _localizedValues[locale.languageCode]!['note_title']!;
  String get noteContent =>
      _localizedValues[locale.languageCode]!['note_content']!;

  static Future<void> setLocale(String languageCode) async {
    if (!['en', 'am'].contains(languageCode)) {
      // Default to English if invalid language code
      languageCode = 'en';
    }

    try {
      final prefs = await SharedPreferences.getInstance();

      // Remove old value first to ensure clean state
      await prefs.remove(LANGUAGE_CODE);

      // Set new value with await
      final success = await prefs.setString(LANGUAGE_CODE, languageCode);

      // Force refresh of shared preferences
      await prefs.reload();

      // Verify the change was made
      final actualLanguageCode = prefs.getString(LANGUAGE_CODE);
      debugPrint(
          'Language change to $languageCode - success: $success, actual: $actualLanguageCode');

      if (actualLanguageCode != languageCode) {
        // If not, try one more time with a different approach
        debugPrint('Language change failed, retrying');
        await prefs.clear();
        await prefs.setString(LANGUAGE_CODE, languageCode);
        await prefs.reload();

        final finalCheck = prefs.getString(LANGUAGE_CODE);
        debugPrint('Retry result: $finalCheck');
      }

      // Notify any listeners that are manually checking for language changes
      // This is a common pattern to notify without using Provider
      for (final callback in _localeChangeCallbacks) {
        callback(Locale(languageCode));
      }
    } catch (e) {
      debugPrint('Error setting locale: $e');
      // Fall back to directly setting the locale if SharedPreferences fails
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(LANGUAGE_CODE, languageCode);
      });
    }
  }

  // Callbacks to notify when locale changes
  static final List<void Function(Locale)> _localeChangeCallbacks = [];

  // Register a callback to be notified when locale changes
  static void addLocaleChangeCallback(void Function(Locale) callback) {
    _localeChangeCallbacks.add(callback);
  }

  // Remove a callback
  static void removeLocaleChangeCallback(void Function(Locale) callback) {
    _localeChangeCallbacks.remove(callback);
  }

  static Future<Locale> getLocale() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload(); // Get the latest values

      String languageCode = prefs.getString(LANGUAGE_CODE) ?? 'en';
      debugPrint('Current language from prefs: $languageCode');

      // Validate language code (fallback to English if invalid)
      if (!['en', 'am'].contains(languageCode)) {
        languageCode = 'en';
        await prefs.setString(LANGUAGE_CODE, languageCode);
      }

      return Locale(languageCode);
    } catch (e) {
      debugPrint('Error getting locale: $e');
      return const Locale('en'); // Default to English on error
    }
  }
}
