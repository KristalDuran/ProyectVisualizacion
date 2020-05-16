  import 'package:flutter/material.dart';
// import 'package:proyecto2/src/pages/configurations.dart';

  class Location extends StatefulWidget {

    var titule = 'Provincias';
    var estado = false;

    Location(titule) {
    }

    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ContadorPageState(titule);
    }

  }

  class _ContadorPageState extends State {

    var titule;
    var arr = [{'provincia':'San José', 'state':true},
    {'provincia':'Alajuela', 'state':true},
    {'provincia':'Cartago', 'state':true},
    {'provincia':'Heredia', 'state':true},
    {'provincia':'Guanacaste', 'state':true},
    {'provincia':'Puntarenas', 'state':true},
    {'provincia':'Limón', 'state':true}];
    var menu = false;
    _ContadorPageState(titule){
      this.titule = titule;
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titule),backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
        SizedBox(height: 20.0,),
        Center(child: Text('Gráfico de población discapacitada en Costa Rica'),),
        SizedBox(height: 50.0,),
        //esto se debe sustituir por el gráfico
        FadeInImage(
        image: NetworkImage('https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip'),
        placeholder: AssetImage('assets/original.gif'),
        fadeInDuration: Duration( milliseconds: 200 ),
        height: 300.0,
        fit: BoxFit.cover,
        ),
        Column(
          children: location(arr)
        ),

        ],
      ),
      
    );}

    List<Widget> location(array) {
    var edadesWidget = <Widget>[];
    edadesWidget.add(SizedBox(height: 25.0,));
    edadesWidget.add(Text('Seleccione las provincias', style: TextStyle(fontWeight: FontWeight.bold)));
    edadesWidget.add(SizedBox(height: 15.0,));
    for (var edad in array) {
      edadesWidget.add(Divider());
      edadesWidget.add(
        CheckboxListTile(
          title: Text(edad['provincia']),
          checkColor: Colors.white,
          activeColor: Colors.teal,
          value: edad['state'],
          onChanged: (newValue) {
            edad['state'] = newValue;
            setState(() {
              arr = array;
            });
          }
        )
      );
    }
    return edadesWidget;
  }
  }
