import 'package:flutter/material.dart';
import 'package:proyecto2/src/pages/alert_page.dart';
import 'package:proyecto2/src/providers/menu_provider.dart';
import 'package:proyecto2/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Censos Costa Rica'),backgroundColor: Colors.deepPurpleAccent
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print(snapshot.data);
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  
  }
  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    opciones.add(SizedBox(height: 200.0,));
    opciones.add(Divider());
  if (data == null) {
    return [];
  }
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color : Colors.deepPurpleAccent),
        onTap: (){

//          Navigator.pushNamed(context, opt['ruta']);
          final route = MaterialPageRoute(
             builder: (context) {
               return AlertPage(opt['texto']);
             }
           );
           Navigator.push(context, route);
        }
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    return opciones;
  }
  
}

// final route = MaterialPageRoute(
//             builder: (context) {
//               return AlertPage();
//             }
//           );
//           Navigator.push(context, route);