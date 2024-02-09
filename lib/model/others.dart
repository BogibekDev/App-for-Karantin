import 'package:json_annotation/json_annotation.dart';

part 'others.g.dart';

@JsonSerializable()
class Others {
  String? created;
  String? updated;
  String? deleted;

  Others({
    required this.created,
    required this.updated,
    required this.deleted,
  });

  factory Others.fromJson(Map<String, dynamic> json) => _$OthersFromJson(json);

  Map<String, dynamic> toJson() => _$OthersToJson(this);
}
