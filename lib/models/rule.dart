class Rule {
  final String kodeRule;
  final List<String> gejala;
  final String hasil;
  final String kategori;

  Rule({
    required this.kodeRule,
    required this.gejala,
    required this.hasil,
    required this.kategori,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      kodeRule: json['kode_rule'],
      kategori: json['kategori'],
      hasil: json['hasil'],

      gejala: json['kondisi_if']
          .toString()
          .split(',')
          .map((e) => e.trim().split('=').first)
          .toList(),
    );
  }
}