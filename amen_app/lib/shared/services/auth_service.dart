import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isAdmin = false;
  String? _currentUserEmail;

  bool get isAuthenticated => _isAuthenticated;
  bool get isAdmin => _isAdmin;
  String? get currentUserEmail => _currentUserEmail;

  Future<void> login(String email, String password) async {
    // Fake login logic for testing
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate network delay

    // Admin login
    if (email.toLowerCase() == 'admin@example.com' && password == 'admin123') {
      _isAuthenticated = true;
      _isAdmin = true;
      _currentUserEmail = email;
    }
    // Regular user login
    else if (email.toLowerCase() == 'user@example.com' &&
        password == 'user123') {
      _isAuthenticated = true;
      _isAdmin = false;
      _currentUserEmail = email;
    }
    // Default test login (admin)
    else if (email.isEmpty && password.isEmpty) {
      _isAuthenticated = true;
      _isAdmin = true;
      _currentUserEmail = 'admin@example.com';
    }
    // Default test login (user)
    else if (email == 'test@example.com' && password == 'password') {
      _isAuthenticated = true;
      _isAdmin = false;
      _currentUserEmail = email;
    } else {
      throw 'Invalid email or password';
    }

    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    // Fake registration logic
    await Future.delayed(const Duration(milliseconds: 500));
    _isAuthenticated = true;
    _isAdmin = false; // New registrations are not admin by default
    _currentUserEmail = email;
    notifyListeners();
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isAuthenticated = false;
    _isAdmin = false;
    _currentUserEmail = null;
    notifyListeners();
  }
}
