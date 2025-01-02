import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import '../components/Cards.dart';
import '../components/Buttons.dart';

class TradeCipherHomeScreen extends StatefulWidget {
  const TradeCipherHomeScreen({Key? key}) : super(key: key);

  @override
  _TradeCipherHomeScreenState createState() => _TradeCipherHomeScreenState();
}

class _TradeCipherHomeScreenState extends State<TradeCipherHomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: FadeTransition(
          opacity: _controller,
          child: const Text('TradeCipher',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
          )),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Crypto Portfolio',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CryptoCard(
                        assetName: 'Bitcoin',
                        balance: '2.5 BTC',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
