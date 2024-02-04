import 'package:flutter/material.dart';

import '../model/Employee.dart';

class DetailPage extends StatefulWidget {
  final Employee employee;
  const DetailPage(this.employee, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: Center(child: Text(widget.employee.name ?? "")),
    );
  }
}
