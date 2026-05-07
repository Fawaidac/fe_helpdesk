import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextExtensions on BuildContext {
  Size get deviceSize => MediaQuery.sizeOf(this);
}

extension DateTimeExtensions on String {
  String toFormattedDateIndonesia() {
    try {
      final dateTime = DateTime.parse(this);

      final date = DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);

      final time = DateFormat('HH:mm', 'id_ID').format(dateTime);

      return '$date • $time';
    } catch (e) {
      return this;
    }
  }
}
