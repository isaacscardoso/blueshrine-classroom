import 'package:isar/isar.dart';

part 'student_model.g.dart';

@collection
class StudentModel {
  Id? id = Isar.autoIncrement;
  final String name;
  final String email;
  final String phone;
  final String? description;
  final double monthlyPayment;
  final bool isActive;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  StudentModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.monthlyPayment,
    required this.isActive,
    this.id,
    this.description,
    this.updatedAt,
    this.createdAt,
  });
}
