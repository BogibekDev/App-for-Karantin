

import '../model/Employee.dart';
import '../model/equipment.dart';


List<Employee> employees = [employee, employee2, employee3, employee4];

Employee employee = Employee(
  id: "1",
  name: "Bogibek Matyaqubov Otaxonovich",
  birthday: "12.12.1997",
  passport:"AA 1234567",
  education: "Oliy",
  specialty: "Informatika va AT",
  graduatedInstitution: "TATU",
  graduatedYear:"2016",
  startDateOfWork:"12.12.2016",
  numberOfOrder: "N 9999999",
  jshshir:"99999999999999",
  position:"Aytishnik",
  department: "Moliya",
  imageUrl:
      "https://www.indiafilings.com/learn/wp-content/uploads/2023/03/Can-a-single-person-own-a-firm-in-India.jpg",
  phoneNumber: "+998942344432",
 
);


List equipments = [equipment, equipment, equipment];


Employee employee2 = Employee(
  id: "2",
  name: "Azamatjon",
  birthday: "12.12.1997",
  education: "education",
  graduatedInstitution: "graduatedInstitution",
  specialty: "specialty",
  department: "department",
  imageUrl:
      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
  phoneNumber: "phoneNumber",
);
Employee employee3 = Employee(
  id: "3",
  name: "Qummijon",
  birthday: "12.12.1997",
  education: "education",
  graduatedInstitution: "graduatedInstitution",
  specialty: "specialty",
  department: "department",
  imageUrl: "https://storage.needpix.com/rsynced_images/man-388104_1280.jpg",
  phoneNumber: "phoneNumber",
);
Employee employee4 = Employee(
  id: "4",
  name: "Boburjon",
  birthday: "12.12.1997",
  education: "education",
  graduatedInstitution: "graduatedInstitution",
  specialty: "specialty",
  department: "department",
  imageUrl:
      "https://www.newvisiontheatres.com/wp-content/uploads/2023/06/Dwayne-Johnson.jpg",
  phoneNumber: "phoneNumber",
);

Equipment equipment = Equipment(
  id: 1,
  name: "Macbook pro",
  count: 1,
  value: 20000000.0,
  inventorNumber: "123343123",
  employeeID:"1"
);
