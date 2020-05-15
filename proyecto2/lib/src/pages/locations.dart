  import 'package:flutter/material.dart';
// import 'package:proyecto2/src/pages/configurations.dart';

  class Location extends StatefulWidget {

    var titule;
    var estado = false;

    Location(titule) {
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
    var tipo = true;
    var sexo = false;
    var edad = false;
    var provincia = false;
    var menu = false;
    _ContadorPageState(titule){
      this.titule = titule;
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titule),backgroundColor: Colors.deepPurpleAccent,
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

        SizedBox(height: 90.0,),
        j(),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.build, color: Colors.white,),
        onPressed: () {
          setState(() {
            menu = !menu;
          });
          print(menu);
//          final route = MaterialPageRoute(
//              builder: (context) {
//                return AvatarPage();
//              }
//          );
//          Navigator.push(context, route);
        },),
    );}


    Widget j() {
      return
        Column(
          children: <Widget>[
            Divider(),
            CheckboxListTile(
              title: Text("Tipo de discapacidad"),
              checkColor: Colors.white,
              activeColor: Colors.deepPurpleAccent,
              value: tipo,
              onChanged: (newValue) {
                setState(() {
                  tipo = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,),
            Divider(),
            CheckboxListTile(
              title: Text("Sexo"),
              value: sexo,
              checkColor: Colors.white,
              activeColor: Colors.deepPurpleAccent,
              onChanged: (newValue) {
                setState(() {
                  sexo = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,),
            Divider(),
            CheckboxListTile(
              title: Text("Edad"),
              value: edad,
              checkColor: Colors.white,
              activeColor: Colors.deepPurpleAccent,
              onChanged: (newValue) {
                setState(() {
                  edad = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,),
            Divider(),
            CheckboxListTile(
              title: Text("Provincia"),
              value: provincia,
              checkColor: Colors.white,
              activeColor: Colors.deepPurpleAccent,
              onChanged: (newValue) {
                setState(() {
                  provincia = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,),
            Divider(),
          ]
        );
    }
  }
