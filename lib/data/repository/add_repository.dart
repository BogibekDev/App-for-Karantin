import '../../model/ishchi.dart';
import '../../model/others.dart';
import '../remote/api_service.dart';

class AddRepository {
  AddRepository(this.apiService);
  ApiService apiService;

  Future<Others> addEmployee(Employee employee,
          {String sheetID = "e6wmrpwy5bljy"}) =>
      apiService.addEmployee(employee, sheetID: sheetID);
}
