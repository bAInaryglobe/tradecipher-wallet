import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/Home.dart';

void main() {
  runApp(const TradeCipherApp());
}

class TradeCipherApp extends StatelessWidget {
  const TradeCipherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return MaterialApp(
      title: 'TradeCipher',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
        useMaterial3: true,
        cardTheme: CardTheme(
          elevation: 8,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const TradeCipherHomeScreen(),
    );
  }
}
