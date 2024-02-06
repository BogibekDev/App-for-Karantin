import 'package:flutter/material.dart';

import '../model/Employee.dart';
import '../views/info_card_widget.dart';
import '../views/my_list_tile.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 56, left: 20, right: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.black38
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 10,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: InfoCardWidget(employee: widget.employee),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 56,
                      foregroundImage:
                          NetworkImage(widget.employee.imageUrl ?? ""),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: MyListTile(
                    category: "Passport",
                    text: widget.employee.passport ?? "",
                  ),
                ),
                Expanded(
                  child: MyListTile(
                    category: "JSHSHIR",
                    text: widget.employee.jshshir ?? "",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MyListTile(
                    category: "Tug'ilgan sana",
                    text: widget.employee.birthday ?? "",
                  ),
                ),
                Expanded(
                  child: MyListTile(
                    category: "Ma'lumoti",
                    text: widget.employee.education ??"",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MyListTile(
                    category: "Mutaxsislik",
                    text: widget.employee.specialty ?? "",
                  ),
                ),
                Expanded(
                  child: MyListTile(
                    category: "Tugatgan muassasasi",
                    text: "${widget.employee.graduatedInstitution} ${widget.employee.graduatedYear}",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MyListTile(
                    category: "Buyruq sanasi",
                    text: widget.employee.startDateOfWork ?? "",
                  ),
                ),
                Expanded(
                  child: MyListTile(
                    category: "Buyruq raqami",
                    text: "${widget.employee.numberOfOrder}",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
