class Employee {
  int? id;
  String? name;
  String? birthday;
  String? education;
  String? graduatedInstitution;
  String? specialty;
  String? department;
  String? imageUrl;
  String? phoneNumber;
  List<Equipment>? equipments;

  Employee({
    this.id,
    this.name,
    this.birthday,
    this.education,
    this.graduatedInstitution,
    this.specialty,
    this.department,
    this.imageUrl,
    this.phoneNumber,
    this.equipments,
  });
}

class Equipment {
  int? id;
  String? name;
  int? count;
  double? value;

  Equipment({
    this.id,
    this.name,
    this.count,
    this.value,
  }
  );
}
