import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/app_theme.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  void _onTap(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
    // case 1 for videos, 2 for saved, 3 for profile will be added later
    }
  }

  @override
  Widget build(BuildContext context) {
    // This logic ensures the correct nav item is highlighted when routes change
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    if (location.startsWith('/home')) {
      _currentIndex = 0;
    }

    return Scaffold(
      body: widget.child,
      floatingActionButton: FloatingActionButton(
        onPressed: () { /* TODO: Navigate to search */ },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.search, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.transparent,
        elevation: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                border: Border(top: BorderSide(color: Colors.white.withOpacity(0.1))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', 0),
                  _buildNavItem(Icons.movie_creation_outlined, 'Videos', 1),
                  const SizedBox(width: 48), // The space for the FAB
                  _buildNavItem(Icons.bookmark_border, 'Saved', 2),
                  _buildNavItem(Icons.person_outline, 'Profile', 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
        size: 28,
      ),
      onPressed: () => _onTap(index),
    );
  }
}
