class SkincareProduct {
  final int id;
  final String code;
  final String name;
  final String brand;
  final String description;

  SkincareProduct({
    required this.id,
    required this.code,
    required this.name,
    required this.brand,
    required this.description,
  });

  factory SkincareProduct.fromJson(Map<String, dynamic> json) {
    return SkincareProduct(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      brand: json['category'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name": name,
      "category": brand,
      "description": description,
    };
  }
}