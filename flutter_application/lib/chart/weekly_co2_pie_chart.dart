import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/chart_data/weekly_co2_pie_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeeklyCO2PieChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections:
            WeeklyCO2PieChartSectionData(MediaQuery.of(context).size.width)));
  }
}
