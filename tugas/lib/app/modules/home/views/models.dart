// models.dart
import 'dart:convert';

class Welcome {
  String status;
  int totalResults;
  List<Article> articles;

  Welcome({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Welcome.fromJson(String str) => Welcome.fromMap(json.decode(str));

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
  );
}

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    source: Source.fromMap(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );
}
