import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  static const String baseUrl =
      "http://10.205.159.36/skinsense_api";

  static Future<List<dynamic>> getRule(String kategori) async {

  final response = await http.get(
    Uri.parse(
      "$baseUrl/getRule.php?kategori=$kategori",
    ),
  );

  if (response.statusCode == 200) {

    final json = jsonDecode(response.body);

    return json["data"];

  }

  throw Exception("Gagal mengambil rule");

}

}