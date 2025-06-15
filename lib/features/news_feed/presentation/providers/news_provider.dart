import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/datasources/remote/news_api_service.dart';
import 'package:news_app/domain/entities/article.dart';

final newsApiServiceProvider = Provider<NewsApiService>((ref) => NewsApiService());

final newsProvider = FutureProvider.family<List<Article>, String>((ref, category) async {
  final newsService = ref.watch(newsApiServiceProvider);
  return await newsService.getTopHeadlines(category: category.toLowerCase());
});
