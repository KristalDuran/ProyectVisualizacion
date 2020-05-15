import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'location': Icons.location_on,
  'age': Icons.calendar_today,
  'gender': Icons.people_outline,
};

Icon getIcon(String nombreIcon) {
  return Icon(_icons[nombreIcon], color : Colors.teal );
}