import 'package:coinbaseclone/components/primaryButton.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/protect_wallet_screen/protect_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithRecoveryPhrase extends StatelessWidget {
  const SignInWithRecoveryPhrase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.01,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign in with a recovery phrase",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const Text(
                  "This is a 12 word phrase you were given when you created previous wallet.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Learn more.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromARGB(255, 249, 249, 249),
                    hintText: 'Recovery phrase',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: primaryButton(
              insideText: "Next",
              backgroundColor: kPrimaryColor,
              buttonHeight: 50,
              buttonWidth: MediaQuery.of(context).size.width,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ProtectWallet(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
