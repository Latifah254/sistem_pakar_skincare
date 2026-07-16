class SkincareProduct {
  final int id;
  final String code;
  final String name;
  final String brand;
  final String description;
  final String ingredient;
  final String usage;
  final String image;

  SkincareProduct({
    required this.id,
    required this.code,
    required this.name,
    required this.brand,
    required this.description,
    required this.ingredient,
    required this.usage,
    required this.image,
  });

  factory SkincareProduct.fromJson(Map<String, dynamic> json) {
    return SkincareProduct(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      brand: json['category'],
      description: json['description'],
      ingredient: json["ingredient"],
      usage: json["usage"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name": name,
      "category": brand,
      "description": description,
      "ingredient":ingredient,
      "usage":usage,
      "image":image,
    };
  }
}