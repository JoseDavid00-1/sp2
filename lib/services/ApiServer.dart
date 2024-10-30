import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl;

  APIService(this.baseUrl);

  Future<Map<String, List<Map<String, dynamic>>>> fetchSemesters() async {
    final response = await http.get(Uri.parse('$baseUrl/cursos'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Asegúrate de que el JSON sea un mapa con claves de tipo String
      // y valores de tipo List<Map<String, dynamic>>
      return Map<String, List<Map<String, dynamic>>>.from(jsonResponse);
    } else {
      throw Exception('Failed to load semesters');
    }
  }
}
