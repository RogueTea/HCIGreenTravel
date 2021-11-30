import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/chart_data/home_page_line_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/main.dart';

double distance = double.parse(LearnPageState.distanceInput.text.toString());

class homePageLineChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData:
            FlGridData(drawHorizontalLine: false, drawVerticalLine: false),
        titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: false,
            ),
            leftTitles: SideTitles(
              interval: 100,
              reservedSize: 50,
              showTitles: false,
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
        minX: 1,
        minY: 0,
        maxX: 13,
        maxY: 1600,
        lineBarsData: homePageLineChartBarData,
      ),
    );
  }
}
