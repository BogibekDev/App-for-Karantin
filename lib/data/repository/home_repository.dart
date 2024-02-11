import '../../model/ishchi.dart';
import '../remote/api_service.dart';

class HomeRepository {
  HomeRepository(this.apiService);
  ApiService apiService;

  Future<List<Employee>> getAllEmployees(
          {String sheetID = "e6wmrpwy5bljy", int page = 1}) =>
      apiService.getAllEmployees(sheetID: sheetID, offset: (page - 1) * 20);
}
