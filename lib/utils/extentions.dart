import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Utils {
  static bool isDesktop() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}


extension Price on double {
  String price() {
    var s = toString();
    s = s.substring(0, s.length - 2);
    var result = s[s.length - 1];
    for (int i = 1; i < s.length; i++) {
      if (i % 3 == 0) {
        result = "${s[s.length - i - 1]} $result";
      } else {
        result = s[s.length - i - 1] + result;
      }
    }
    return "$result UZS";
  }
}

final educations = [
  "O'rta",
  "O'rta Maxsus",
  "Tugallanmagan Oliy",
  "Oliy",
];

const apiID = "irrh6nkxv54i5";

final departments = [
  "Moliya",
  "Department2",
  "Department3",
  "Department4",
];
