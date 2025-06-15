import 'package:news_app/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    String? sourceName,
    required String title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) : super(
    sourceName: sourceName,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json['source']?['name'],
      title: json['title'] ?? 'No Title',
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] != null ? DateTime.tryParse(json['publishedAt']) : null,
    );
  }
}