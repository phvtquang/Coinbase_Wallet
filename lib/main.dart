import 'package:coinbaseclone/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/first_screen/FirstScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
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
        textTheme: GoogleFonts.interTextTheme(),
        backgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: kPrimaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FirstScreen(),
    );
  }
}
