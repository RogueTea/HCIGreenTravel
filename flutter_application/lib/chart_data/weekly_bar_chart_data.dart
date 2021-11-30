import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> weeklyBarChartGroupData = [
  BarChartGroupData(x: 1, barRods: [
    BarChartRodData(
        y: 30 * 192,
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 2, barRods: [
    BarChartRodData(
        y: 30 * 105,
        width: 12.5,
        colors: [Colors.red.shade300],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ])
];
