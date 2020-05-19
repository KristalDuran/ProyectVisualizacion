  import 'package:flutter/material.dart';
  import 'package:syncfusion_flutter_charts/charts.dart';
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
    var arr = [{'provincia':'San José', 'state':true, 'name':'SJ', 'total':23782.0},
    {'provincia':'Alajuela', 'state':true, 'name':'AL', 'total':14081.0},
    {'provincia':'Cartago', 'state':true, 'name':'CA', 'total':7074.0},
    {'provincia':'Heredia', 'state':true, 'name':'HE', 'total':6113.0},
    {'provincia':'Guanacaste', 'state':true, 'name':'GU', 'total':5722.0},
    {'provincia':'Puntarenas', 'state':true, 'name':'PU', 'total':7564.0},
    {'provincia':'Limón', 'state':true, 'name':'LI', 'total':6373.0}];
    List<ChartData> chartData = [
            ChartData("SJ", 23782),
            ChartData("AL", 14081),
            ChartData("CA", 7074),
            ChartData("HE", 6113),
            ChartData("GU", 5722),
            ChartData("PU", 7564),
            ChartData("LI", 6373)
        ];
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
        SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: "Provincias"
                      )
                    ),
                    series: <ChartSeries<ChartData, String>>[
                      // Renders bubble chart
                      ColumnSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData location, _) => location.x,
                          yValueMapper: (ChartData location, _) => location.y
                      )
                    ]
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
              setAno();
            });
          }
        )
      );
    }
    return edadesWidget;
  }

  void setAno(){
    List<ChartData> chartDataNew = [];
    for (var edad in arr) {
      if (edad['state']) {
        print(edad);
        ChartData chart = ChartData(edad['name'], edad['total']);
        chartDataNew.add(chart);
      }
    }
    print(chartDataNew);
    setState(() {
      chartData = chartDataNew;
    });
  }
  }
  class ChartData {
        ChartData(this.x, this.y);
            final String x;
            final double y;
  }
