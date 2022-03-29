// ignore: file_names
import 'package:coinbaseclone/components/primaryButton.dart';
import 'package:coinbaseclone/screens/restoreWallet_screen/RestoreWalletScreen.dart';
import 'package:coinbaseclone/screens/second_screen/SecondScreen.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          const Center(
            child: Text(
              'coinbase WALLET',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
          const Spacer(),
          primaryButton(
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            insideText: "Create a new wallet",
            textColor: Colors.white,
            backgroundColor: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
          ),
          SizedBox(
            // space between two buttons
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          /*
          primaryButton(
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            backgroundColor: Colors.white,
            insideText: "I already have a wallet",
            textColor: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RestoreWallet(),
                ),
              );
            },
          ),
          */
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const RestoreWallet(),
                  ),
                );
              },
              child: const Text(
                "I already have a wallet",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: kPrimaryColor,
                shadowColor: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            // bottom space
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }
}
