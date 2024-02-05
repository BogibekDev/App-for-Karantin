import 'dart:io';

import 'package:employees/pages/add_page.dart';
import 'package:employees/pages/detail_page.dart';
import 'package:employees/utils/extentions.dart';
import 'package:flutter/material.dart';

import '../model/Employee.dart';
import '../utils/fake_data.dart';
import '../views/employee_item.dart';

class HomePage extends StatefulWidget {
  static const route = "/homePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Employee> result = [];

  @override
  void initState() {
    result = employees;
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
