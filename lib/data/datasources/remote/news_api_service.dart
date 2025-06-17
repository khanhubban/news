import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/data/models/article_model.dart';

class NewsApiService {
  final Dio _dio;
  static const String _apiKey = "2aba24949d6049e29a731818bd33e1d9";

  NewsApiService() : _dio = Dio(BaseOptions(baseUrl: "https://newsapi.org/v2"));

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      final response = await _dio.get(
        '/top-headlines',
        queryParameters: {
          'country': 'us',
          'category': category,
          'apiKey': _apiKey,
        },
      );
      final articles = (response.data['articles'] as List)
          .map((json) => ArticleModel.fromJson(json))
          .toList();
      return articles.where((article) => article.title != "[Removed]").toList();
    } on DioException catch (e) {
      if (kDebugMode) print('DioError: ${e.response?.data}');
      throw Exception('Failed to load news: ${e.message}');
    }
  }

  // NEW: Method for searching articles.
  Future<List<ArticleModel>> searchArticles({required String query}) async {
    try {
      final response = await _dio.get(
        '/everything',
        queryParameters: {
          'q': query,
          'sortBy': 'popularity',
          'apiKey': _apiKey,
        },
      );
      final articles = (response.data['articles'] as List)
          .map((json) => ArticleModel.fromJson(json))
          .toList();
      return articles.where((article) => article.title != "[Removed]").toList();
    } on DioException catch (e) {
      if (kDebugMode) print('DioError: ${e.response?.data}');
      throw Exception('Failed to search news: ${e.message}');
    }
  }
}
