import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? sourceName;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;

  const Article({
    this.sourceName,
    required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  @override
  List<Object?> get props => [sourceName, title, url];
}
