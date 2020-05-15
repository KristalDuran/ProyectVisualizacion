import 'package:flutter/material.dart';
import 'package:proyecto2/src/pages/age.dart';
import 'package:proyecto2/src/pages/home_page.dart';
import 'package:proyecto2/src/pages/gender.dart';
import 'package:proyecto2/src/pages/locations.dart';

Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{
    '/'      : (BuildContext context ) => HomePage(),
    'age'  : (BuildContext context ) => Age(''),
    'gender' : (BuildContext context ) => Gender(''),
    'location' : (BuildContext context ) => Location(''),
  };
}

