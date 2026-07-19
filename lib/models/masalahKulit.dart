class SkinProblem {
  final int id;
  final String code;
  final String name;

  SkinProblem({
    required this.id,
    required this.code,
    required this.name,
  });

  factory SkinProblem.fromJson(Map<String, dynamic> json) {
    return SkinProblem(
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