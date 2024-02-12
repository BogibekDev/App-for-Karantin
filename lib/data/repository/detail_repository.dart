import 'package:employees/data/remote/api_service.dart';

import '../../model/equipment.dart';

class DetailRepository {
  DetailRepository(this.apiService);
  ApiService apiService;

  Future<List<Equipment>> getAllEmployees(
    int employeeID, {
    String sheetID = "e6wmrpwy5bljy",
  }) => apiService.getEquipmentsByEmployeeID(employeeID, sheetID: sheetID);
}
