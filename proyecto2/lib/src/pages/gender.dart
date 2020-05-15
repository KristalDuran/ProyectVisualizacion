  import 'package:flutter/material.dart';
// import 'package:proyecto2/src/pages/configurations.dart';

  class Gender extends StatefulWidget {

    var titule;
    var estado = false;

    Gender(titule) {
      this.titule = titule;
    }

    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _ContadorPageState(titule);
    }

  }

  class _ContadorPageState extends State {

    var titule;
    var man = true;
    var woman = false;
    _ContadorPageState(titule){
      this.titule = titule;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(titule),backgroundColor: Colors.deepPurpleAccent,),
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

          SizedBox(height: 90.0,),
          j(),

          ],
        )
      );
    }

    Widget j() {
      return
        Column(
          children: <Widget>[
            Divider(),
          ]
        );
    }
  }
