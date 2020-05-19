  import 'package:flutter/material.dart';
  import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:proyecto2/src/pages/configurations.dart';

  class Gender extends StatefulWidget {

    var titule = 'Género';
    var estado = false;

    Gender(titule) {
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
    var woman = true;
    _ContadorPageState(titule){
      this.titule = titule;
    }

    @override
    Widget build(BuildContext context) {
      List<ChartData> chartData = [
            ChartData("Hablar", 16595,12812),
            ChartData("Caminar o subir gradas", 64271, 76109),
            ChartData("Utilizar brazos o manos", 23001, 25858),
            ChartData("Intelectual", 19968, 15448)
        ];
      return Scaffold(
        appBar: AppBar(title: Text(titule),backgroundColor: Colors.teal,),
        body: ListView(
        children: <Widget>[
        SizedBox(height: 20.0,),
        Center(child: Text('Gráfico de población discapacitada en Costa Rica'),),
        SizedBox(height: 50.0,),
        //esto se debe sustituir por el gráfico
        SfCartesianChart(
              primaryXAxis: CategoryAxis(
                title: AxisTitle(text: "Tipo discapacidad"
                )
              ),
              series: <ChartSeries<ChartData, String>>[
                // Renders bubble chart
                BarSeries<ChartData, String>(
                  isVisible: man,
                    dataSource: chartData,
                    xValueMapper: (ChartData age, _) => age.x,
                    yValueMapper: (ChartData age, _) => age.y,
                    legendItemText: "Hombres"
                ),
                BarSeries<ChartData, String>(
                  isVisible: woman,
                    dataSource: chartData,
                    xValueMapper: (ChartData age, _) => age.x,
                    yValueMapper: (ChartData age, _) => age.y2,
                    legendItemText: "Mujeres"
                )
              ],
            legend: Legend(
              isVisible: true,
              // Toogless the series visibility on tapping the legend item
              toggleSeriesVisibility: true,
              position: LegendPosition.bottom
            )
        ),
        
        column(),
        ],
        )
      );
    }

    Widget column() {
      return
        Column(
          children: <Widget>[
            SizedBox(height: 25.0,),
            Text('Selecione el género', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0,),
            Divider(),
            CheckboxListTile(
            title: Text("Mujeres"),
            checkColor: Colors.white,
            activeColor: Colors.teal,
            value: woman,
            onChanged: (newValue) {
              setState(() {
                woman = newValue;
              });
            }
            ),
            Divider(),
            CheckboxListTile(
            title: Text("Hombres"),
            checkColor: Colors.white,
            activeColor: Colors.teal,
            value: man,
            onChanged: (newValue) {
              setState(() {
                man = newValue;
              });
            }
            )
          ]
        );
    }
  }
  class ChartData {
        ChartData(this.x, this.y, this.y2);
            final String x;
            final double y;
            final double y2;
  }
