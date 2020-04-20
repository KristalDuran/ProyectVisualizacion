import 'package:flutter/material.dart';
import 'package:proyecto2/src/pages/alert_page.dart';

class AvatarPage extends StatelessWidget {

  AvatarPage() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuraciones'),backgroundColor: Colors.deepPurpleAccent
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 70.0,),
          Center(
            child: Text('Seleccione el tipo de gráfico que desea visualizar')
          ),
          SizedBox(height: 150.0,),
          Divider(),
          ListTile(

            title: Text('Barra'),
            leading: Icon(Icons.assessment),
            trailing: Icon(Icons.keyboard_arrow_right, color : Colors.deepPurpleAccent),
            onTap: (){

//          Navigator.pushNamed(context, opt['ruta']);
              final route = MaterialPageRoute(
                  builder: (context) {
                    return AlertPage('');
                  }
              );
              Navigator.push(context, route);
            }
          ),
          Divider(),
          ListTile(
              title: Text('Circular'),
              leading: Icon(Icons.pie_chart),
              trailing: Icon(Icons.keyboard_arrow_right, color : Colors.deepPurpleAccent),
              onTap: (){

//          Navigator.pushNamed(context, opt['ruta']);
                final route = MaterialPageRoute(
                    builder: (context) {
                      return AlertPage('');
                    }
                );
                Navigator.push(context, route);
              }
          ),
          Divider(),
        ],
      ),
    );
  }
}