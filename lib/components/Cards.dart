import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String assetName;
  final String balance;
  const CryptoCard({Key? key, required this.assetName, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(assetName),
        subtitle: Text('$balance'),
      ),
    );
  }
}
