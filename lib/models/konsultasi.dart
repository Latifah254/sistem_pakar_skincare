class Consultation {
  final List<String> symptoms;
  final String skinType;
  final String skinProblem;
  final List<String> recommendations;

  Consultation({
    required this.symptoms,
    required this.skinType,
    required this.skinProblem,
    required this.recommendations,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      symptoms: List<String>.from(json['symptoms']),
      skinType: json['skinType'],
      skinProblem: json['skinProblem'],
      recommendations: List<String>.from(json['recommendations']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "symptoms": symptoms,
      "skinType": skinType,
      "skinProblem": skinProblem,
      "recommendations": recommendations,
    };
  }
}