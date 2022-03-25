import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Candle> candles = List.generate(14, (i) {
    return Candle(date: DateTime(2022, 1, i + 1), open: i * 100, high: i * 100 + 150, low: i * 100 - 100, close: (i + 1) * 100, volume: Random().nextDouble() * 1000);
  });

  @override
  void initState() {
    List<Candle> data = [
      Candle(date: DateTime(2022, 1, 17), open: 1900.00, high: 1973.00, low: 1600.00, close: 1800.00, volume: 3),
      Candle(date: DateTime(2022, 1, 16), open: 1800.00, high: 1950.00, low: 1800.00, close: 1900.00, volume: 2),
      Candle(date: DateTime(2022, 1, 15), open: 1850.00, high: 1900.00, low: 1750.00, close: 1800.00, volume: 1),
    ];

    for (var candle in data) {
      candles.add(candle);
    }

    candles.sort((a, b) => a.date.compareTo(b.date));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('demo'),
      ),
      body: Center(
        child: Candlesticks(candles: candles),
      ),
    );
  }
}
