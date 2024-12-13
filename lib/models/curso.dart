class Course {
  final int semester;
  final int id;
  final String name;
  final String colorHex;
  final String? emoji; // Cambiado a opcional

  Course({
    required this.semester,
    required this.id,
    required this.name,
    required this.colorHex,
    this.emoji,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      semester: int.tryParse(map['semester'].toString()) ??
          0, // Manejo seguro de conversiones
      id: int.tryParse(map['id'].toString()) ?? 0, // Convertir ID a int
      name: map['name'] as String,
      colorHex: map['colorHex'] as String,
      emoji: map['emoji'] as String?, // Puede ser nulo
    );
  }
}
