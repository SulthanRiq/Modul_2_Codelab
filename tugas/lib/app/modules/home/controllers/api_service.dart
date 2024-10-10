import 'package:tugas/app/modules/home/views/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Welcome> fetchWelcome() async {
    final response = await http.get(Uri.parse('https://my-json-server.typicode.com/Fallid/codelab-api/db'));

    if (response.statusCode == 200) {
      return welcomeFromJson(response.body);
    } else {
      throw Exception('Failed to load welcome');
    }
  }
}