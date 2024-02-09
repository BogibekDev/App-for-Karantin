import 'package:employees/data/remote/api_service.dart';
import 'package:employees/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../model/ishchi.dart';
import '../utils/extentions.dart';
import '../utils/fake_data.dart';
import '../views/employee_item.dart';
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

  final logger = Logger();
  final ApiService _apiService = ApiService.create();

  @override
  void initState() {
    result = employees;
    final HomeRepository repository = HomeRepository(_apiService);
    repository.getAllEmployees().then((responce) => {
          responce.forEach((element) {
            logger.d(element.name);
          })
        });
    super.initState();
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
            Expanded(
              child: ListView.builder(
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
