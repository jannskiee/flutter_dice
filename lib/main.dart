import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1a1b1e),
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                'Dice Game',
                style: TextStyle(
                  fontFamily: 'PressStart2P',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xFF1a1b1e),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;
  int totalRolls = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'Total Dice Roll: $totalRolls',
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            getDiceComparisonText(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String getDiceComparisonText() {
    if (left > right) {
      return 'Left dice is higher!';
    } else if (right > left) {
      return 'Right dice is higher!';
    } else {
      return 'Both dice are equal!';
    }
  }

  void changeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    totalRolls++;
  }
}
