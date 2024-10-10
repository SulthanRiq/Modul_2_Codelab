import 'package:http/http.dart' as http;
import 'package:tugas/app/modules/home/views/models.dart';

class ApiService {
  Future<Welcome> fetchArticles() async {
    final response = await http.get(
      Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8849ce4f79484316bb3d4e00adfd54ef'), // Ganti dengan URL API Anda
    );

    if (response.statusCode == 200) {
      return Welcome.fromJson(response.body);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
