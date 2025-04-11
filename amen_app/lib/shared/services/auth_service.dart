import 'package:flutter/foundation.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    // TODO: Implement actual login logic
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    // TODO: Implement actual registration logic
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    // TODO: Implement actual logout logic
    _isAuthenticated = false;
    notifyListeners();
  }
}
