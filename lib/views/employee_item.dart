import 'package:flutter/material.dart';
import '../model/Employee.dart';

class EmployeeItem extends StatefulWidget {
  final Employee employee;
  final Function(Employee) onItemClick;

  const EmployeeItem({
    super.key,
    required this.employee,
    required this.onItemClick,
  });

  @override
  State<EmployeeItem> createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onItemClick.call(widget.employee);
      },
      child: Card(
        key: ValueKey(widget.employee.id ?? 1),
        elevation: 4,
        // color: const Color.fromARGB(255, 224, 223, 223),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                foregroundImage: NetworkImage(
                  widget.employee.imageUrl ??
                      'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-person-icon.png',
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.employee.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            //call to phone number
                          },
                          child: const Icon(Icons.phone),
                        ),
                        const SizedBox(width: 10),
                        Text(widget.employee.phoneNumber ?? "")
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
