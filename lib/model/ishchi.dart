import 'package:json_annotation/json_annotation.dart';

part 'ishchi.g.dart';

@JsonSerializable()
class Employee {
  String? id;
  String? name;
  String? birthday;
  String? education;
  String? graduatedInstitution;
  String? graduatedYear;
  String? specialty;
  String? department;
  String? imageUrl;
  String? phoneNumber;
  String? jshshir;
  String? passport;
  String? position;
  String? startDateOfWork;
  String? numberOfOrder;
  String? ponishmentCount;

  Employee({
    this.id,
    this.name,
    this.birthday,
    this.passport,
    this.jshshir,
    this.education,
    this.specialty,
    this.graduatedInstitution,
    this.graduatedYear,
    this.startDateOfWork,
    this.numberOfOrder,
    this.position,
    this.department,
    this.imageUrl,
    this.phoneNumber,
    this.ponishmentCount = "0",
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

