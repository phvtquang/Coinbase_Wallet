import 'package:coinbaseclone/components/custom_primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/legal_screen/legal_screen.dart';
import 'package:coinbaseclone/screens/restore_wallet_screen/restore_wallet_screen.dart';

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
          CustomPrimaryButton(
            buttonHeight: 50,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            insideText: 'Create a new wallet',
            textColor: Colors.white,
            backgroundColor: kPrimaryColor,
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute<void>(
                  builder: (context) => const LegalScreen(),
                ),
              );
            },
          ),
          SizedBox(
            // space between two buttons
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (context) => const RestoreWallet(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: kPrimaryColor,
                shadowColor: Colors.transparent,
              ),
              child: const Text(
                'I already have a wallet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
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
