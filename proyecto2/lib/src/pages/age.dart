  import 'package:flutter/material.dart';
  import 'package:syncfusion_flutter_charts/charts.dart';
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

    var titule;
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
      this.titule = titule;
    }

    @override
    Widget build(BuildContext context) {
       List<ChartData> chartData = [
            ChartData("0-14", 14471, 0.06, Color.fromRGBO(255, 100, 102, 1)),
            ChartData("15-29", 30661, 0.12 , Color.fromRGBO(0, 100, 102, 1)),
            ChartData("30-59", 117509, 0.47, Color.fromRGBO(255, 100, 19, 1)),
            ChartData("60-64", 22374, 0.09, Color.fromRGBO(157, 21, 21, 1)),
            ChartData("65-74", 34089, 0.14, Color.fromRGBO(0, 211, 0, 1)),
            ChartData("75-89", 28368, 0.11, Color.fromRGBO(23, 23, 200, 1)),
            ChartData("90+", 3992, 0.02, Color.fromRGBO(230, 230, 0, 1))
        ];
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
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: "Rango de edades"
                      )
                    ),
                    series: <ChartSeries<ChartData, String>>[
                      // Renders bubble chart
                      BubbleSeries<ChartData, String>(
                          dataSource: chartData,
                          sizeValueMapper: (ChartData age, _) => age.size,
                          pointColorMapper:(ChartData sales, _) => sales.pointColor,
                          xValueMapper: (ChartData age, _) => age.x,
                          yValueMapper: (ChartData age, _) => age.y
                      )
                    ]
                  ),

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
    return edadesWidget;
  }
  

  }
  class ChartData {
        ChartData(this.x, this.y, this.size, this.pointColor);
            final String x;
            final double y;
            final double size;
            final Color pointColor;
  }

