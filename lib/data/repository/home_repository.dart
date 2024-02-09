
import 'package:employees/model/employee.dart';

import '../remote/api_service.dart';

class HomeRepository {
  HomeRepository(this.apiService);
  ApiService apiService;

  Future<List<Employee>> getAllEmployees() => apiService.getAllEmployees();
}
