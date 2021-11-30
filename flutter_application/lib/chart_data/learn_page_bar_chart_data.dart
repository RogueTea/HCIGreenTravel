import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';

double distance = double.parse(LearnPageState.distanceInput.text.toString());

List<BarChartGroupData> learnPageBarChartGroupData = [
  BarChartGroupData(x: 1, barRods: [
    BarChartRodData(
        y: 0,
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 2, barRods: [
    BarChartRodData(
        y: double.parse((41 * distance).toStringAsFixed(2)),
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 3, barRods: [
    BarChartRodData(
        y: double.parse((53 * distance).toStringAsFixed(2)),
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 4, barRods: [
    BarChartRodData(
        y: double.parse((105 * distance).toStringAsFixed(2)),
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 5, barRods: [
    BarChartRodData(
        y: double.parse((171 * distance).toStringAsFixed(2)),
        width: 12.5,
        colors: [Colors.red.shade300],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ]),
  BarChartGroupData(x: 6, barRods: [
    BarChartRodData(
        y: double.parse((192 * distance).toStringAsFixed(2)),
        width: 12.5,
        colors: [Color(0xff7DA4A8)],
        borderRadius: BorderRadius.all(Radius.circular(0))),
  ])
];
