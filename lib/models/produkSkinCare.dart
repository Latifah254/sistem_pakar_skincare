class SkincareProduct {
  final int id;
  final String code;
  final String name;
  final String category;
  final String description;
  final String ingredient;
  final String cara_pakai;
  final String image;

  SkincareProduct({
    required this.id,
    required this.code,
    required this.name,
    required this.category,
    required this.description,
    required this.ingredient,
    required this.cara_pakai,
    required this.image,
  });

  factory SkincareProduct.fromJson(Map<String, dynamic> json) {
    return SkincareProduct(
      id: int.parse(json['id'].toString()),
      code: json['code'].toString(),
      name: json['name'].toString(),
      category: json['category'].toString(),
      description: json['description'].toString(),
      ingredient: json['ingredient'].toString(),
      cara_pakai: json['cara_pakai'].toString(),
      image: json['image'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name": name,
      "category": category,
      "description": description,
      "ingredient": ingredient,
      "cara_pakai": cara_pakai,
      "image": image,
    };
  }
}