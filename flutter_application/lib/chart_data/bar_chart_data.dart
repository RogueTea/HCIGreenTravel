import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<BarChartGroupData> barChartGroupData = [
  BarChartGroupData(x: 1, barRods: [
    BarChartRodData(
        y: 0,
        width: 20,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 2, barRods: [
    BarChartRodData(
        y: 0,
        width: 20,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 3, barRods: [
    BarChartRodData(
        y: 300,
        width: 20,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 4, barRods: [
    BarChartRodData(
        y: 175,
        width: 20,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ])
];
