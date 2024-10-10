import 'package:flutter/material.dart';
import 'package:tugas/app/modules/home/controllers/api_service.dart';
import 'package:tugas/app/modules/home/views/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleListScreen(),
    );
  }
}

class ArticleListScreen extends StatefulWidget {
  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  late Future<Welcome> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = ApiService().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: FutureBuilder<Welcome>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                final article = snapshot.data!.articles[index];
                return ListTile(
                  leading: article.urlToImage != null
                      ? Image.network(article.urlToImage!)
                      : Container(width: 50, height: 50, color: Colors.grey),
                  title: Text(article.title),
                  subtitle: Text(article.description ?? 'No description'),
                  onTap: () {
                    // Buka detail artikel atau link URL
                    _openArticle(article.url);
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _openArticle(String url) {
    // Implementasi untuk membuka link artikel
  }
}
