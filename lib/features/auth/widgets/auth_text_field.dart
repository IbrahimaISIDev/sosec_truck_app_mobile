import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? toggleVisibility;
  final ValueChanged<String> onChanged;

  const AuthTextField({
    required this.hintText,
    required this.icon,
    required this.onChanged,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.toggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword && !isPasswordVisible,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: AppColors.white),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.white,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        filled: true,
        fillColor: AppColors.lightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: AppColors.white),
      ),
      style: const TextStyle(color: AppColors.white),
    );
  }
}