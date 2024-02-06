import 'package:flutter/material.dart';

import '../utils/res_colors.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.category,
    required this.text,
  });

  final String category;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: const TextStyle(
              color: ResColors.subTileColor,
              fontSize: 14,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: ResColors.nameColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
