import 'package:flutter/material.dart';

class TradeCipherHomeScreen extends StatefulWidget {
  const TradeCipherHomeScreen({Key? key}) : super(key: key);

  @override
  _TradeCipherHomeScreenState createState() => _TradeCipherHomeScreenState();
}

class _TradeCipherHomeScreenState extends State<TradeCipherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TradeCipher')),
      body: Center(child: Text('Welcome to your hybrid crypto wallet!')),
    );
  }
}
