
import 'package:flutter/material.dart';

import '../model/Employee.dart';
import '../utils/res_colors.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    required this.employee,
  });

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 66),
        Text(
          employee.name ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            color: ResColors.nameColor,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Lavozim",
                    style: TextStyle(
                      color: ResColors.subTileColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    employee.position ?? "",
                    style: const TextStyle(
                      color: ResColors.nameColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 1.5,
              height: 40,
              color: ResColors.nameColor,
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    "Bo'lim",
                    style: TextStyle(
                      color: ResColors.subTileColor,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    employee.department ?? "",
                    style: const TextStyle(
                      color: ResColors.nameColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: ResColors.phoneIconColor,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {},
              child: Text(
                "${employee.phoneNumber}",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}