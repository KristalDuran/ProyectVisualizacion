  import 'package:flutter/material.dart';
  import 'package:syncfusion_flutter_charts/charts.dart';
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
      List<ChartData> chartData = [
            ChartData("Para hablar", 16595,),
            ChartData("Para caminar o subir gradas", 64271,),
            ChartData("Para utilizar brazos o manos", 23001,),
            ChartData("Del tipo intelectual", 19968,)
        ];
      return Scaffold(
        appBar: AppBar(title: Text(titule),backgroundColor: Colors.deepPurpleAccent,),
        body: ListView(
          children: <Widget>[
          SizedBox(height: 20.0,),
          Center(child: Text('Gráfico de población discapacitada en Costa Rica'),),
          SizedBox(height: 50.0,),
          //esto se debe sustituir por el gráfico
          SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      title: AxisTitle(text: "Discapacidad por género"
                      )
                    ),
                    series: <ChartSeries<ChartData, String>>[
                      // Renders bubble chart
                      BarSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData age, _) => age.x,
                          yValueMapper: (ChartData age, _) => age.y
                      )
                    ]
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
  class ChartData {
        ChartData(this.x, this.y);
            final String x;
            final double y;
  }
