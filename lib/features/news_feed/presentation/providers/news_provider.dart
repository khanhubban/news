import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/data/datasources/remote/news_api_service.dart';
import 'package:news_app/domain/entities/article.dart';

// This provider creates an instance of our NewsApiService
final newsApiServiceProvider = Provider<NewsApiService>((ref) => NewsApiService());

// This FutureProvider fetches and caches the news for each category.
// The ".family" modifier allows us to pass the category name as a parameter.
final newsProvider = FutureProvider.family<List<Article>, String>((ref, category) async {
  final newsService = ref.watch(newsApiServiceProvider);
  return await newsService.getTopHeadlines(category: category.toLowerCase());
});