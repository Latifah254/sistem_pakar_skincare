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
      id: int.parse(json['id'].toString()),
      code: json['code'].toString(),
      name: json['name'].toString(),
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