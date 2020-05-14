import 'package:flutter/material.dart';
import 'package:proyecto2/src/pages/menu.dart';
import 'package:proyecto2/src/pages/configurations.dart';
import 'package:proyecto2/src/pages/home_page.dart';


Map<String, WidgetBuilder> getAplicationRoute() {
  return <String, WidgetBuilder>{
    '/'      : (BuildContext context ) => HomePage(),
     'alert'  : (BuildContext context ) => AlertPage(''),
    'avatar' : (BuildContext context ) => AvatarPage(),
  };
}

