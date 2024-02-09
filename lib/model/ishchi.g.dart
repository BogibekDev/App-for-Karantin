// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ishchi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as String?,
      name: json['name'] as String?,
      birthday: json['birthday'] as String?,
      passport: json['passport'] as String?,
      jshshir: json['jshshir'] as String?,
      education: json['education'] as String?,
      specialty: json['specialty'] as String?,
      graduatedInstitution: json['graduatedInstitution'] as String?,
      graduatedYear: json['graduatedYear'] as String?,
      startDateOfWork: json['startDateOfWork'] as String?,
      numberOfOrder: json['numberOfOrder'] as String?,
      position: json['position'] as String?,
      department: json['department'] as String?,
      imageUrl: json['imageUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      ponishmentCount: json['ponishmentCount'] as String? ?? "0",
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'education': instance.education,
      'graduatedInstitution': instance.graduatedInstitution,
      'graduatedYear': instance.graduatedYear,
      'specialty': instance.specialty,
      'department': instance.department,
      'imageUrl': instance.imageUrl,
      'phoneNumber': instance.phoneNumber,
      'jshshir': instance.jshshir,
      'passport': instance.passport,
      'position': instance.position,
      'startDateOfWork': instance.startDateOfWork,
      'numberOfOrder': instance.numberOfOrder,
      'ponishmentCount': instance.ponishmentCount,
    };
