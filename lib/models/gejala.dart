class Gejala {
  final int id;
  final String code;
  final String question;

  Gejala({
    required this.id,
    required this.code,
    required this.question,
  });

  factory Gejala.fromJson(Map<String, dynamic> json) {
    return Gejala(
      id: json['id'],
      code: json['code'],
      question: json['question'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "code": code,
      "question": question,
    };
  }
}