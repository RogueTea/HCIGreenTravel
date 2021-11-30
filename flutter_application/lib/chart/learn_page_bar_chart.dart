import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/chart_data/learn_page_bar_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/main.dart';

double distance = double.parse(LearnPageState.distanceInput.text.toString());

class LearnPageBarChartContent extends StatefulWidget {
  @override
  State<LearnPageBarChartContent> createState() =>
      _LearnPageBarChartContentState();
}

class _LearnPageBarChartContentState extends State<LearnPageBarChartContent> {
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'Train';
                case 2:
                  return 'Car (electric)';
                case 3:
                  return 'Bus';
                case 4:
                  return 'Car (petrol)';
                case 5:
                  return 'Car (diesel)';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            interval: 100,
            reservedSize: 50,
            showTitles: true,
            getTitles: (value) {
              if (value.toInt() == 0)
                return '';
              else
                return value.toInt().toString();
            },
          ),
          rightTitles: SideTitles(
              showTitles: false,
              reservedSize: 0,
              getTitles: (value) {
                return '';
              }),
          topTitles: SideTitles(
              showTitles: false,
              getTitles: (value) {
                return '';
              })),
      borderData:
          FlBorderData(border: Border.all(color: Colors.black, width: 0.5)),
      alignment: BarChartAlignment.spaceEvenly,
      maxY: (distance + 0.5) * 192,
      barGroups: learnPageBarChartGroupData,
    ));
  }
}
