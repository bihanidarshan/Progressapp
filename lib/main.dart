import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Progress Bar Example'),
        ),
        body: Center(
          child: CircularProgressBars(),
        ),
      ),
    );
  }
}

class CircularProgressBars extends StatelessWidget {
  double getDayProgress() {
    final now = DateTime.now();
    final totalSecondsInDay = 24 * 60 * 60;
    final secondsPassed = now.hour * 3600 + now.minute * 60 + now.second;
    return secondsPassed / totalSecondsInDay;
  }

  double getYearProgress() {
    final now = DateTime.now();
    final startOfYear = DateTime(now.year, 1, 1);
    final endOfYear = DateTime(now.year + 1, 1, 1);
    final totalSecondsInYear = endOfYear.difference(startOfYear).inSeconds;
    final secondsPassed = now.difference(startOfYear).inSeconds;
    return secondsPassed / totalSecondsInYear;
  }

  @override
  Widget build(BuildContext context) {
    final dayProgress = getDayProgress();
    final yearProgress = getYearProgress();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Percentage of Day Completed',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CircularProgressIndicator(
          value: dayProgress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          strokeWidth: 10,
        ),
        SizedBox(height: 10),
        Text(
          '${(dayProgress * 100).toStringAsFixed(2)}%',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 30),
        Text(
          'Percentage of Year Completed',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        CircularProgressIndicator(
          value: yearProgress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          strokeWidth: 10,
        ),
        SizedBox(height: 10),
        Text(
          '${(yearProgress * 100).toStringAsFixed(2)}%',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
