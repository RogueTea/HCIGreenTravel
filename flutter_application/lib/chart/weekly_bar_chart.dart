import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/chart_data/weekly_bar_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeeklyBarChartContent extends StatefulWidget {
  @override
  State<WeeklyBarChartContent> createState() => _WeeklyBarChartContentState();
}

class _WeeklyBarChartContentState extends State<WeeklyBarChartContent> {
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'Car (petrol)';
                case 2:
                  return 'Bus';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            interval: ((30 + 0.5) * 192) / 5,
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
      maxY: (30 + 2) * 192,
      barGroups: weeklyBarChartGroupData,
    ));
  }
}
