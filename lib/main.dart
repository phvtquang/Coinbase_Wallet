import 'package:coinbaseclone/constant.dart';
import 'package:flutter/material.dart';
import 'screens/first_screen/FirstScreen.dart';

void main() {
  runApp(const CoinbaseClone());
}

class CoinbaseClone extends StatelessWidget {
  const CoinbaseClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coinbase',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FirstScreen(),
    );
  }
}
