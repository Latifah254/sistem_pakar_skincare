class SkincareProduct {
  final int id;
  final String name;
  final String category;
  final String description;

  SkincareProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
  });

  factory SkincareProduct.fromJson(Map<String, dynamic> json) {
    return SkincareProduct(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "category": category,
      "description": description,
    };
  }
}