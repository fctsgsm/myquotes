import 'dart:math';
import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  final Map<String, dynamic> quote;

  QuotesPage(this.quote);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  // List of gradient colors
  final List<List<Color>> gradientColors = [
    [Colors.blue, Colors.green],
    [Colors.orange, Colors.black12],
    [Colors.purple, Colors.pink],
    [Colors.teal, Colors.indigo],
    // Add more gradient color combinations as needed
  ];


  @override
  Widget build(BuildContext context) {
    // Randomly pick a gradient
    final Random random = Random();
    final List<Color> selectedGradient =
        gradientColors[random.nextInt(gradientColors.length)];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: selectedGradient,
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.quote['textdata'] ?? "No quote available",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
