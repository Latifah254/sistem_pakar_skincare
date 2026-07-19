import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sistem_pakar_skincare/models/produkSkincare.dart';

class ProductRepository {

  static const String baseUrl =
      "http://10.205.159.36/skinsense_api";

  static Future<List<SkincareProduct>> getProducts() async {

    final response = await http.get(
      Uri.parse("$baseUrl/getProduk.php"),
    );

    if(response.statusCode == 200){

      final json = jsonDecode(response.body);

      final List data = json["data"];

      return data
          .map((e)=>SkincareProduct.fromJson(e))
          .toList();

    }

    throw Exception("Gagal mengambil data produk");

  }

}