import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> WeeklyCO2PieChartSectionData(double screenWidth) {
  double radius = screenWidth * 0.05;

  return [
    PieChartSectionData(
      value: 15,
      title: 'Train',
      radius: radius,
      color: Color(0xff785663),
    ),
    PieChartSectionData(
      value: 50,
      title: 'Car(Diesel)',
      radius: radius,
      color: Color(0xff7DA4A8),
    ),
    PieChartSectionData(
      value: 10,
      title: 'Bus',
      radius: radius,
      color: Color(0xff84BA96),
    ),
    PieChartSectionData(
      value: 25,
      title: '      Car (electric)',
      radius: radius,
      color: Color(0xffBC7F7F),
    ),
  ];
}
