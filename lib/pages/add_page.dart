import 'package:employees/model/employee.dart';
import 'package:employees/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _jshshsirController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();
  final TextEditingController _grInstutController = TextEditingController();
  final TextEditingController _grYearController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _orderNumberController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  var value = "";

  final Employee employee = Employee();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: const Text('Add Employee'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _selectImage();
                      },
                      child: const CircleAvatar(
                        radius: 150,
                        foregroundImage: NetworkImage(
                            "https://www.indiafilings.com/learn/wp-content/uploads/2023/03/Can-a-single-person-own-a-firm-in-India.jpg"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nameController,
                      maxLines: 1,
                      maxLength: 60,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Azamatov Azamat Azamatovich",
                          label: Text("Name")),
                    ),
                    //birtday phone
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _birthdayController,
                            readOnly: true,
                            maxLength: 14,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Birthday",
                              label: const Text("Birtday"),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  _pickBirthday(context);
                                },
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ),
                            onTap: () {
                              _pickBirthday(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneNumberController,
                            maxLines: 1,
                            maxLength: 9,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.phone_iphone),
                                border: OutlineInputBorder(),
                                hintText: "942344432",
                                label: Text("Phone Number")),
                          ),
                        )
                      ],
                    ),
                    //passport jshshir
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passportController,
                            maxLines: 1,
                            maxLength: 9,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.book),
                                border: OutlineInputBorder(),
                                hintText: "AA1234567",
                                label: Text("Passport")),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _jshshsirController,
                            maxLines: 1,
                            maxLength: 14,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.menu_book),
                                border: OutlineInputBorder(),
                                hintText: "12345678901234",
                                label: Text("JSHSHIR")),
                          ),
                        )
                      ],
                    ),
                    //edu
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.cast_for_education),
                                border: OutlineInputBorder(),
                                label: Text("Ma'lumot"),
                                hintText: "Ma'lumot"),
                            items: educations
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _educationController.text = value ?? "";
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _specialtyController,
                            maxLines: 1,
                            maxLength: 14,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(),
                                hintText: "Informatika va AT",
                                label: Text("Mutaxasislik")),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _grInstutController,
                            maxLines: 1,
                            maxLength: 9,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.apartment),
                                border: OutlineInputBorder(),
                                hintText: "TATU",
                                label: Text("Tugallagan Muassasasi")),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _grYearController,
                            maxLines: 1,
                            maxLength: 4,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                border: OutlineInputBorder(),
                                hintText: "2016",
                                label: Text("Tugatgan yil")),
                          ),
                        )
                      ],
                    ),

                    //postion/bo'lim
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _positionController,
                            maxLines: 1,
                            maxLength: 14,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.work),
                                border: OutlineInputBorder(),
                                hintText: "Glavniy buxgalter",
                                label: Text("Lavozim")),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.cast_for_education),
                                border: OutlineInputBorder(),
                                label: Text("Bo'lim"),
                                hintText: "Bo'lim"),
                            items: departments
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _departmentController.text = value ?? "";
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    //date/nomer
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _startDateController,
                            readOnly: true,
                            maxLength: 14,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "19.12.1993",
                              label: const Text("Ishga kirgan sana"),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  _pickOrderDate(context);
                                },
                                icon: const Icon(Icons.calendar_month),
                              ),
                            ),
                            onTap: () {
                              _pickOrderDate(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _orderNumberController,
                            maxLines: 1,
                            maxLength: 14,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.mode_standby),
                                border: OutlineInputBorder(),
                                hintText: "№ 12312312",
                                label: Text("Buyruq raqami")),
                          ),
                        )
                      ],
                    ),
                    //passport jshshir
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                    color: Colors.green,
                    onPressed: () {
                      _collectObject();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _collectObject() {
    if (_isNotEmpty()) {
      employee
        ..name = _nameController.text
        ..birthday = _birthdayController.text
        ..phoneNumber = _phoneNumberController.text
        ..passport = _passportController.text
        ..jshshir = _jshshsirController.text
        ..education = _educationController.text
        ..specialty = _specialtyController.text
        ..graduatedInstitution = _grInstutController.text
        ..graduatedYear = _grYearController.text
        ..position = _positionController.text
        ..department = _departmentController.text
        ..startDateOfWork = _startDateController.text
        ..numberOfOrder = _orderNumberController.text;
    } else {
      print("Maydonlarni to'diring");
    }
  }

  bool _isNotEmpty() {
    return _nameController.text.isNotEmpty &&
        _birthdayController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _passportController.text.isNotEmpty &&
        _jshshsirController.text.isNotEmpty &&
        _educationController.text.isNotEmpty &&
        _specialtyController.text.isNotEmpty &&
        _grInstutController.text.isNotEmpty &&
        _grYearController.text.isNotEmpty &&
        _positionController.text.isNotEmpty &&
        _departmentController.text.isNotEmpty &&
        _startDateController.text.isNotEmpty &&
        _orderNumberController.text.isNotEmpty;
  }

  void _pickBirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      setState(() {
        _birthdayController.text = formattedDate;
      });
    }
  }

  void _pickOrderDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      setState(() {
        _startDateController.text = formattedDate;
      });
    }
  }

  void _selectImage() async {
    // const XTypeGroup typeGroup = XTypeGroup(
    //   label: 'images',
    //   //extensions: <String>['jpg', 'png'],
    // );
    // final XFile? file =
    //     await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
  }
}
