import 'package:coinbaseclone/constant.dart';
import 'package:flutter/material.dart';
import 'FirstScreen.dart';

void main() {
  runApp(const CoinbaseClone());
}

class CoinbaseClone extends StatelessWidget {
  const CoinbaseClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
