  import 'package:flutter/material.dart';
// import 'package:proyecto2/src/pages/configurations.dart';

  class Age extends StatefulWidget {

    var titule;
    var estado = false;

    Age(titule) {
      this.titule = titule;
    }

    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ContadorPageState(titule);
    }

  }

  class _ContadorPageState extends State {

    var titule = 'Edades';
    var tipo = true;
    var sexo = false;
    var edad = false;
    var provincia = false;
    var arr = [{'edad':'De 0 a 14 años', 'state':true},
        {'edad':'De 15 a 29 años', 'state':true},
        {'edad':'De 30 a 59 años', 'state':true},
        {'edad':'De 60 a 64 años', 'state':true},
        {'edad':'De 65 a 74 años', 'state':true},
        {'edad':'De 75 a 89 años', 'state':true},
        {'edad':'De 90 años y más', 'state':true}];
    var menu = false;
    _ContadorPageState(titule){
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titule),backgroundColor: Colors.teal),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                  SizedBox(height: 20.0,),
                  Center(child: Text('Gráfico de población con discapacidad para ver en Costa Rica clasificada por su edad'),),
                  SizedBox(height: 50.0,),
                  

                  FadeInImage(
                  image: NetworkImage('https://images.theconversation.com/files/125391/original/image-20160606-13080-s7o3qu.jpg?ixlib=rb-1.1.0&rect=273%2C0%2C2639%2C1379&q=45&auto=format&w=926&fit=clip'),
                  placeholder: AssetImage('assets/original.gif'),
                  fadeInDuration: Duration( milliseconds: 200 ),
                  height: 300.0,
                  fit: BoxFit.cover,
                  ), 
                  //aca va el grafico


                  Column(
                    children: edades(arr),
                  )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> edades(array) {
    var edadesWidget = <Widget>[];
    edadesWidget.add(SizedBox(height: 25.0,));
    edadesWidget.add(Text('Seleccione los rangos de edades', style: TextStyle(fontWeight: FontWeight.bold)));
    edadesWidget.add(SizedBox(height: 15.0,));
    for (var edad in arr) {
      edadesWidget.add(Divider());
      edadesWidget.add(
        CheckboxListTile(
          title: Text(edad['edad']),
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
    print(arr);
    return edadesWidget;
  }

  }
