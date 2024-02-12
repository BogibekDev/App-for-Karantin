import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable()
class Equipment {
  String? id;
  String? name;
  String? count;
  String? value;
  String? inventorNumber;
  String? employeeID;

  Equipment({
    this.id,
    this.name,
    this.count,
    this.value,
    this.inventorNumber,
    this.employeeID,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
