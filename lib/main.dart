import 'package:coinbaseclone/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/first_screen/FirstScreen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().whenComplete(
    () {
      if (kDebugMode) {
        print('completed');
      }
    },
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
