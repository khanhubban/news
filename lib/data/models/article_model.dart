import 'package:news_app/domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    String? sourceName,
    String? author,
    required String title,
    String? description,
    String? content,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
  }) : super(
    sourceName: sourceName,
    author: author,
    title: title,
    description: description,
    content: content,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json['source']?['name'],
      author: json['author'],
      title: json['title'] ?? 'No Title',
      description: json['description'],
      content: json['content'], // NEW
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] != null ? DateTime.tryParse(json['publishedAt']) : null,
    );
  }
}
