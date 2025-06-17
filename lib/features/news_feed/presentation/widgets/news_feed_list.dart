import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/features/news_feed/presentation/providers/news_provider.dart';
import 'package:news_app/features/news_feed/presentation/widgets/compact_article_card.dart';
import 'package:news_app/features/news_feed/presentation/widgets/hero_card.dart';
import 'package:news_app/features/news_feed/presentation/widgets/standard_article_card.dart';
import 'package:shimmer/shimmer.dart';

class NewsFeedList extends ConsumerWidget {
  final String category;
  const NewsFeedList({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsyncValue = ref.watch(newsProvider(category));

    return articlesAsyncValue.when(
      data: (articles) {
        if (articles.isEmpty) {
          return const Center(child: Text('No articles found.', style: TextStyle(color: AppTheme.textSecondary)));
        }
        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            if (index == 0) {
              return HeroCard(article: article);
            } else if (index < 3) {
              return StandardArticleCard(article: article);
            } else {
              return CompactArticleCard(article: article);
            }
          },
        );
      },
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey[900]!,
        highlightColor: Colors.grey[800]!,
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              if (index == 0) return Container(height: 250, margin: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)));
              return Container(height: 120, margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)));
            }
        ),
      ),
      error: (error, stack) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // UPDATED: A more user-friendly error message.
          child: Text(
            'Could not load news.\nPlease check your internet connection or try a different network.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, height: 1.5),
          ),
        ),
      ),
    );
  }
}
