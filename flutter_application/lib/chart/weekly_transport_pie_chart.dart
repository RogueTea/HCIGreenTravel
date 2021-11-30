import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_application/chart_data/weekly_transport_pie_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeeklyTransportPieChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 0,
        sections: WeeklyTransportPieChartSectionData(
            MediaQuery.of(context).size.width)));
  }
}
