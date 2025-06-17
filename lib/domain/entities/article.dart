import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String? sourceName;
  final String? author;
  final String title;
  final String? description;
  final String? content;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;

  const Article({
    this.sourceName,
    this.author,
    required this.title,
    this.description,
    this.content,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  // NEW: A unique ID for each article, perfect for Firestore document IDs.
  String get id {
    if (url == null) return title;
    // Create a unique and stable ID by hashing the article's URL.
    return sha1.convert(utf8.encode(url!)).toString();
  }

  // Convert our Article object to a Map so it can be saved in Firestore.
  Map<String, dynamic> toJson() {
    return {
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'content': content,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.toIso8601String(),
    };
  }

  // Create an Article object from a Firestore document (a Map).
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      sourceName: json['sourceName'],
      author: json['author'],
      title: json['title'] ?? 'No Title',
      description: json['description'],
      content: json['content'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] != null ? DateTime.tryParse(json['publishedAt']) : null,
    );
  }


  @override
  List<Object?> get props => [sourceName, author, title, url];
}