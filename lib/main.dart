import 'package:flutter/material.dart';
import '/home/nathfavour/Documents/code/tradecipher/tradecipher/lib/screens/Home.dart';

void main() {
  runApp(const TradeCipherApp());
}

class TradeCipherApp extends StatelessWidget {
  const TradeCipherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TradeCipher',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TradeCipherHomeScreen(),
    );
  }
}
