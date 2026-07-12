class SkinType {
  final int id;
  final String code;
  final String name;

  SkinType({
    required this.id,
    required this.code,
    required this.name,
  });

  factory SkinType.fromJson(Map<String, dynamic> json) {
    return SkinType(
      id: json['id'],
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "name": name,
    };
  }
}