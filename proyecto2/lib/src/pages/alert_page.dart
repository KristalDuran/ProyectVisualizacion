  import 'package:flutter/material.dart';
import 'package:proyecto2/src/pages/avatar_page.dart';

  class AlertPage extends StatefulWidget {

    var titule;
    var estado = false;

    AlertPage(titule) {
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
// /// Example of a bar chart with grouped, stacked series oriented vertically with
// /// a custom weight pattern.
// ///
// /// This is a pattern of weights used to calculate the width of bars within a
// /// bar group. If not specified, each bar in the group will have an equal width.
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class GroupedStackedWeightPatternBarChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

//   GroupedStackedWeightPatternBarChart(this.seriesList, {this.animate});

//   factory GroupedStackedWeightPatternBarChart.withSampleData() {
//     return new GroupedStackedWeightPatternBarChart(
//       createSampleData(),
//       // Disable animations for image tests.
//       animate: false,
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return new charts.BarChart(
//       seriesList,
//       animate: animate,
//       // Configure the bar renderer in grouped stacked rendering mode with a
//       // custom weight pattern.
//       //
//       // The first stack of bars in each group is configured to be twice as wide
//       // as the second stack of bars in each group.
//       defaultRenderer: new charts.BarRendererConfig(
//         groupingType: charts.BarGroupingType.groupedStacked,
//         weightPattern: [2, 1],
//       ),
//     );
//   }

//   /// Create series list with multiple series
//   static List<charts.Series<OrdinalSales, String>> createSampleData() {
//     final desktopSalesDataA = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];

//     final tableSalesDataA = [
//       new OrdinalSales('2014', 25),
//       new OrdinalSales('2015', 50),
//       new OrdinalSales('2016', 10),
//       new OrdinalSales('2017', 20),
//     ];

//     final mobileSalesDataA = [
//       new OrdinalSales('2014', 10),
//       new OrdinalSales('2015', 15),
//       new OrdinalSales('2016', 50),
//       new OrdinalSales('2017', 45),
//     ];

//     final desktopSalesDataB = [
//       new OrdinalSales('2014', 5),
//       new OrdinalSales('2015', 25),
//       new OrdinalSales('2016', 100),
//       new OrdinalSales('2017', 75),
//     ];

//     final tableSalesDataB = [
//       new OrdinalSales('2014', 25),
//       new OrdinalSales('2015', 50),
//       new OrdinalSales('2016', 10),
//       new OrdinalSales('2017', 20),
//     ];

//     final mobileSalesDataB = [
//       new OrdinalSales('2014', 10),
//       new OrdinalSales('2015', 15),
//       new OrdinalSales('2016', 50),
//       new OrdinalSales('2017', 45),
//     ];

//     return [
//       new charts.Series<OrdinalSales, String>(
//         id: 'Desktop A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Tablet A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tableSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Mobile A',
//         seriesCategory: 'A',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesDataA,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Desktop B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: desktopSalesDataB,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Tablet B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: tableSalesDataB,
//       ),
//       new charts.Series<OrdinalSales, String>(
//         id: 'Mobile B',
//         seriesCategory: 'B',
//         domainFn: (OrdinalSales sales, _) => sales.year,
//         measureFn: (OrdinalSales sales, _) => sales.sales,
//         data: mobileSalesDataB,
//       ),
//     ];
//   }
// }

// /// Sample ordinal data type.
// class OrdinalSales {
//   final String year;
//   final int sales;

//   OrdinalSales(this.year, this.sales);
// }

