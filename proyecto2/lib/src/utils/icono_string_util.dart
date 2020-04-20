import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alarm,
  'accessibility': Icons.accessible,
  'folder_open': Icons.folder_open,

};

Icon getIcon(String nombreIcon) {
  return Icon(_icons[nombreIcon], color : Colors.deepPurpleAccent );
}