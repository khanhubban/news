import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';

class GlassTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const GlassTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor.withAlpha(77), // CORRECTED
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppTheme.border.withAlpha(51), // CORRECTED
          width: 1.5,
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        keyboardType: keyboardType,
        style: const TextStyle(color: AppTheme.textPrimary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppTheme.textSecondary),
          border: InputBorder.none,
        ),
      ),
    );
  }
}