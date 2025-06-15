import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:news_app/features/auth/presentation/widgets/glass_text_field.dart';

final loginLoadingProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final isLoading = ref.watch(loginLoadingProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.backgroundColor),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                      color: Colors.white.withAlpha(13),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withAlpha(26))
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('News App', textAlign: TextAlign.center, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                        const SizedBox(height: 16),
                        const Text('Welcome Back', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: AppTheme.textSecondary)),
                        const SizedBox(height: 48),
                        GlassTextField(
                          controller: emailController,
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains('@')) return 'Please enter a valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        GlassTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 6) return 'Password must be at least 6 characters';
                            return null;
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: isLoading ? null : () async {
                            if (formKey.currentState!.validate()) {
                              ref.read(loginLoadingProvider.notifier).state = true;
                              try {
                                await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                                // CORRECTED: Added context.mounted check
                                if(context.mounted) context.go('/home');
                              } catch (e) {
                                // CORRECTED: Added context.mounted check
                                if(context.mounted) _showErrorSnackbar(context, e.toString());
                              } finally {
                                // CORRECTED: Added mounted check
                                if(ref.context.mounted) ref.read(loginLoadingProvider.notifier).state = false;
                              }
                            }
                          },
                          child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                        const SizedBox(height: 24),
                        TextButton(
                          onPressed: () {
                            context.push('/signup');
                          },
                          child: const Text("Don't have an account? Sign Up", style: TextStyle(color: AppTheme.textSecondary)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

