// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'] as int?,
      name: json['name'] as String?,
      count: json['count'] as int?,
      value: (json['value'] as num?)?.toDouble(),
      inventorNumber: json['inventorNumber'] as String?,
      employeeID: json['employeeID'] as String?,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'value': instance.value,
      'inventorNumber': instance.inventorNumber,
      'employeeID': instance.employeeID,
    };
