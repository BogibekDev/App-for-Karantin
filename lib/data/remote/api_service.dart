import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/ishchi.dart';
import '../../model/equipment.dart';
import '../../model/others.dart';
import '../../utils/extentions.dart';


part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  factory ApiService.create() {
    final Dio dio = Dio();
    final String? baseUrl = dotenv.env['BASE_URL'];
    if (baseUrl != null) {
      return ApiService(dio, baseUrl: baseUrl);
    }
    return ApiService(dio);
  }

  //apiService

  @GET('{sheetID}/')
  Future<List<Employee>> getAllEmployees(
    {
    @Path('sheetID') String sheetID = apiID,
    //@Query("limit") int limit = 20,
    @Query("offset") int offset = 0
  });

  @GET('{sheetID}/search')
  Future<List<Equipment>> getEquipmentsByEmployeeID(
    @Query('employeeID')int employeeID, {
    @Path('sheetID') String sheetID = apiID,
    @Query('sheet') String sheet = 'Equipment',
  });

  @POST('{sheetID}/')
  Future<Others> addEmployee(
    @Body() Employee employee, {
    @Path('sheetID') String sheetID = apiID,
  });

  @POST('{sheetID}/')
  Future<Others> addEquipment(
    @Body() Equipment equipment, {
    @Path('sheetID') String sheetID = apiID,
    @Query('sheet') String sheet = 'Equipment',
  });
}
