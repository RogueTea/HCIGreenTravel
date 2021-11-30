import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> WeeklyTransportPieChartSectionData(
    double screenWidth) {
  double radius = screenWidth * 0.05;

  return [
    PieChartSectionData(
      value: 20,
      title: 'Bus',
      radius: radius,
      color: Color(0xff84BA96),
    ),
    PieChartSectionData(
      value: 35,
      title: 'Car(Diesel)',
      radius: radius,
      color: Color(0xff7DA4A8),
    ),
    PieChartSectionData(
      value: 15,
      title: 'Train',
      radius: radius,
      color: Color(0xff785663),
    ),
    PieChartSectionData(
      value: 30,
      title: 'Car (electric)',
      radius: radius,
      color: Color(0xffBC7F7F),
    ),
  ];
}
