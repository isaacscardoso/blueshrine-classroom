import 'dart:convert';

class StudentModel {
  final int? id;
  final String name;
  final String description;
  final bool isActive;

  StudentModel({
    this.id,
    required this.name,
    required this.description,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isActive': isActive,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isActive: map['is_active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) {
    return StudentModel.fromMap(json.decode(source));
  }
}
