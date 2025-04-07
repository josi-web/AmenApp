import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  String? _currentUserEmail;
  bool _isAuthenticated = false;

  // Get current user email
  String? get currentUserEmail => _currentUserEmail;

  // Check if user is authenticated
  bool get isAuthenticated => _isAuthenticated;

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    // For demo purposes, we'll accept any email/password combination
    // In a real app, you would validate against a database
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    _currentUserEmail = email;
    _isAuthenticated = true;
    notifyListeners();
    return true;
  }

  // Register with email and password
  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    // For demo purposes, we'll accept any registration
    // In a real app, you would validate and store in a database
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    _currentUserEmail = email;
    _isAuthenticated = true;
    notifyListeners();
    return true;
  }

  // Sign out
  Future<void> signOut() async {
    _currentUserEmail = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
