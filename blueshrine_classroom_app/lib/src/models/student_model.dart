import 'dart:convert';

final class StudentModel {
  final int? id;
  final String name;
  final String description;
  final bool isActive;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  StudentModel({
    this.id,
    required this.name,
    required this.description,
    required this.isActive,
    this.updatedAt,
    this.createdAt,
  });

  StudentModel copyWith({
    int? id,
    String? name,
    String? description,
    bool? isActive,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return StudentModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': isActive == true ? 1 : 0,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      isActive: map['status'] == 1 ? true : false,
      updatedAt:
          map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) {
    return StudentModel.fromMap(json.decode(source));
  }
}
