import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'features/user/screens/login_screen.dart';
import 'features/user/screens/register_screen.dart';
import 'features/user/screens/home_screen.dart';
import 'features/admin/screens/admin_home_screen.dart';
import 'shared/services/auth_service.dart';
import 'shared/services/theme_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (context) {
          final themeService = ThemeService();
          themeService.setTheme(ThemeType.night);
          return themeService;
        }),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final authService = Provider.of<AuthService>(context);

    return MaterialApp(
      title: 'Amen App',
      debugShowCheckedModeBanner: false,
      theme: themeService.theme.copyWith(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          themeService.theme.textTheme,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) =>
            authService.isAdmin ? const AdminHomeScreen() : const HomeScreen(),
      },
    );
  }
}
