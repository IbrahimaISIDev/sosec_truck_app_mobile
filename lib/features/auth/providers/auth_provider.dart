import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isLoading => _isLoading;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Simulation de connexion (à remplacer par Firebase plus tard)
  Future<bool> login() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2)); // Simuler un appel réseau
    setLoading(false);

    // Simulation d'une connexion réussie si email et mot de passe ne sont pas vides
    return _email.isNotEmpty && _password.isNotEmpty;
  }

  // Simulation de connexion avec Google (à implémenter plus tard)
  Future<bool> loginWithGoogle() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
    return true; // Simulation
  }
}