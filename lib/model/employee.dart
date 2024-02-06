class Employee {
  int? id;
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
  int? ponishmentCount;

  List<Equipment>? equipments;

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
    this.equipments,
    this.ponishmentCount = 0,
  });
}

class Equipment {
  int? id;
  String? name;
  int? count;
  double? value;
  String? inventorNumber;

  Equipment({
    this.id,
    this.name,
    this.count,
    this.value,
    this.inventorNumber,
  });
}
