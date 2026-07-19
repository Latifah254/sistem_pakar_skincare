import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sistem_pakar_skincare/models/gejala.dart';

class GejalaRepository {
  static const String baseUrl =
      "http://10.205.159.36/skinsense_api";

  static Future<List<Gejala>> getGejala() async {

    final response = await http.get(
      Uri.parse("$baseUrl/getGejala.php"),
    );

    if (response.statusCode == 200) {

      final json = jsonDecode(response.body);

      final List data = json["data"];

      return data
          .map((e) => Gejala.fromJson(e))
          .toList();

    }

    throw Exception("Gagal mengambil data gejala");
  }
}