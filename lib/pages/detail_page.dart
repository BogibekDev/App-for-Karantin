import 'package:employees/data/repository/detail_repository.dart';
import 'package:employees/views/loading_widget.dart';
import 'package:flutter/material.dart';

import '../data/remote/api_service.dart';
import '../model/equipment.dart';
import '../model/ishchi.dart';
import '../utils/extentions.dart';
import '../views/info_card_widget.dart';
import '../views/my_list_tile.dart';

class DetailPage extends StatefulWidget {
  final Employee employee;
  const DetailPage(this.employee, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Equipment> equipments = [];
  bool isLoading = true;
  final ApiService _apiService = ApiService.create();
  late final DetailRepository repository = DetailRepository(_apiService);

  @override
  void initState() {
    _getEqipments(widget.employee.id ?? "1");
    super.initState();
  }

  void _getEqipments(String id) async {
    repository
        .getAllEmployees(int.parse(id), sheetID: "irrh6nkxv54i5")
        .then((respoonse) => _setResponse(respoonse));
  }

  void _setResponse(List<Equipment> response) {
    print(response);
    setState(() {
      equipments.addAll(response);
      isLoading = false;
    });
  }

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
                    color: Utils.isDarkMode(context)
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
                    text: widget.employee.education ?? "",
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
                    text:
                        "${widget.employee.graduatedInstitution} ${widget.employee.graduatedYear}",
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nomidagi inventarlar (${equipments.length})"),
                  const SizedBox(height: 10),
                  isLoading
                      ? const LoadingWidget()
                      : equipments.isEmpty
                          ? const Center(child: Text("Inventar yo'q"))
                          : ListView.builder(
                              // scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: equipments.length,
                              itemBuilder: (context, position) =>
                                  EqupmentItemWidget(
                                equipment: equipments[position],
                              ),
                            ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EqupmentItemWidget extends StatelessWidget {
  const EqupmentItemWidget({
    super.key,
    required this.equipment,
  });

  final Equipment equipment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Utils.isDarkMode(context) ? Colors.black38 : Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyListTile(
                  category: "Inventor nomi",
                  text: "${equipment.name}",
                ),
              ),
              Expanded(
                child: MyListTile(
                  category: "Invetor raqami",
                  text: "${equipment.inventorNumber}",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MyListTile(
                  category: "Inventor soni",
                  text: "${equipment.count}",
                ),
              ),
              Expanded(
                child: MyListTile(
                  category: "Invetor qiymati",
                  text: double.parse(equipment.value ?? "1").price(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
