import 'package:employees/data/remote/api_service.dart';
import 'package:employees/data/repository/home_repository.dart';
import 'package:flutter/material.dart';

import '../model/ishchi.dart';
import '../utils/extentions.dart';
import '../utils/fake_data.dart';
import '../views/employee_item.dart';
import '../views/loading_widget.dart';
import 'add_page.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  static const route = "/homePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Employee> result = [];
  bool isFirstLoading = true;
  bool isLoadMore = false;

  int page = 0;

  final ApiService _apiService = ApiService.create();
  late HomeRepository repository = HomeRepository(_apiService);
  late ScrollController _controller;

  @override
  void initState() {
    _getEmployees();
    _controller = ScrollController()
      ..addListener(() {
        _loadMore();
      });
    
    super.initState();
  }

  void _getEmployees() async {
    isLoadMore = false;
    isFirstLoading = true;
    page++;
    repository.getAllEmployees(page: page).then((res) => {_setResult(res)});
  }

  void _loadMore() async {
    if (!isLoadMore && !isFirstLoading && _controller.position.extentTotal > page*20+4) {
      setState(() {
        isLoadMore = true;
      });
      page++;
      repository.getAllEmployees(page: page).then((res) => {_setResult(res)});
    }
  }

  void _setResult(List<Employee> response) {
    setState(() {
      result.addAll(response);
      isFirstLoading = false;
      isLoadMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value) => _filter(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  label: Text('Search'),
                  hintText: "Search..."),
            ),
            const SizedBox(height: 10),
            isFirstLoading
                ? const LoadingWidget()
                : Expanded(
                    child: ListView.builder(
                      // controller: _controller,
                      itemCount: result.length,
                      itemBuilder: (context, index) => EmployeeItem(
                        employee: result[index],
                        onItemClick: (employeer) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(employeer)),
                          );
                        },
                      ),
                    ),
                  ),
            isLoadMore
                ? const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
      floatingActionButton: Utils.isDesktop()
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddEmployeePage(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : const SizedBox(),
    );
  }

  void _filter(String value) {
    if (value.isEmpty) {
      result = employees;
    } else {
      result = employees
          .where((employee) =>
              employee.name!.toLowerCase().contains(value.toLowerCase()) ||
              employee.phoneNumber!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    setState(() {
      result = result;
    });
  }
}
