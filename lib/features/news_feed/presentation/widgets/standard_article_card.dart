import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/domain/entities/article.dart';

class StandardArticleCard extends StatelessWidget {
  final Article article;
  const StandardArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(13), // Lightweight glass effect
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withAlpha(26)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: Colors.grey[900]),
                    errorWidget: (context, url, error) => Container(height: 200, color: Colors.grey[900], child: const Icon(Icons.error, color: AppTheme.textSecondary)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(article.description ?? '', maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
                    const SizedBox(height: 8),
                    Text(article.sourceName ?? '', style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}