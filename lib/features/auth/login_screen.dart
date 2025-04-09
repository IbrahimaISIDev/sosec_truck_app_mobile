import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'widgets/auth_text_field.dart';
import '../home/home_screen.dart';
import '../../core/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBlue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  // Logo
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.white,
                    child: Text(
                      "SO",
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Titre
                  const Text(
                    "SOSEC",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Sous-titre
                  const Text(
                    "Connexion des chauffeurs",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Formulaire
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          AuthTextField(
                            hintText: "Email",
                            icon: Icons.email,
                            onChanged: provider.setEmail,
                          ),
                          const SizedBox(height: 16),
                          AuthTextField(
                            hintText: "Mot de passe",
                            icon: Icons.lock,
                            isPassword: true,
                            isPasswordVisible: provider.isPasswordVisible,
                            toggleVisibility: provider.togglePasswordVisibility,
                            onChanged: provider.setPassword,
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Navigation vers l'écran de réinitialisation de mot de passe
                              },
                              child: const Text(
                                "Mot de passe oublié ?",
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Bouton de connexion
                          provider.isLoading
                              ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.white),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    final success = await provider.login();
                                    if (success) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const HomeScreen(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Email ou mot de passe incorrect"),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    foregroundColor: AppColors.primaryBlue,
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    "Connexion",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  // Section "Ou connectez-vous avec"
                  const Text(
                    "Ou connectez-vous avec",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bouton Google
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton.icon(
                        onPressed: provider.isLoading
                            ? null
                            : () async {
                                final success =
                                    await provider.loginWithGoogle();
                                if (success) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomeScreen(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Erreur lors de la connexion avec Google"),
                                    ),
                                  );
                                }
                              },
                        icon: const Icon(
                          Icons.g_mobiledata, // Icône Google (simplifiée)
                          color: AppColors.primaryBlue,
                        ),
                        label: const Text("Google"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primaryBlue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  // Pied de page
                  const Text(
                    "SOSEC © 2025",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
