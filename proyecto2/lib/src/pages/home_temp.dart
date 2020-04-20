import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
 
class HomePage extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componente Temp'),
      ),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems() {
    // List<Widget> lista = new List<Widget>();
    // for (String elemento in opciones) {
    //   final tempWidget = ListTile(
    //     title: Text(elemento),
    //   );
    //   lista.add(tempWidget);
    //   lista.add(Divider(color: Colors.grey));
    // }

    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Num'),
            leading: Icon( Icons.dvr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ]
      );
    }).toList();
  }

}