import 'dart:convert';

final class StudentModel {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String? description;
  final double monthlyPayment;
  final bool isActive;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  StudentModel({
    this.id,
    this.description,
    this.updatedAt,
    this.createdAt,
    required this.name,
    required this.email,
    required this.phone,
    required this.monthlyPayment,
    required this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'description': description,
      'monthly_payment': monthlyPayment,
      'status': isActive == true ? 1 : 0,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      description: map['description'] ?? '',
      monthlyPayment: map['monthly_payment']?.toDouble() ?? 0.0,
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
