import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:news_app/features/news_feed/presentation/widgets/news_feed_list.dart'; // FIXED: Import the new widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _tabs = ['General', 'Business', 'Technology', 'Sports'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await ref.read(authRepositoryProvider).signOut();
                },
              );
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          indicatorColor: AppTheme.primaryColor,
          labelColor: AppTheme.primaryColor,
          unselectedLabelColor: AppTheme.textSecondary,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((category) => NewsFeedList(category: category)).toList(),
      ),
    );
  }
}