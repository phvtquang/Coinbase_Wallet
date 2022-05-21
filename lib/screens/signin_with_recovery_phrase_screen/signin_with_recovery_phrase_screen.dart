import 'package:coinbaseclone/components/custom_primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/protect_wallet_screen/protect_wallet_screen.dart';
import 'package:coinbaseclone/service/current_wallet.dart';
import 'package:coinbaseclone/service/fake_blockchain_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInWithRecoveryPhrase extends StatefulWidget {
  const SignInWithRecoveryPhrase({Key? key}) : super(key: key);

  @override
  State<SignInWithRecoveryPhrase> createState() =>
      _SignInWithRecoveryPhraseState();
}

class _SignInWithRecoveryPhraseState extends State<SignInWithRecoveryPhrase> {
  final TextEditingController recoveryPhraseTextFiledController =
      TextEditingController();

  bool isloading = false;
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
                  'Sign in with a recovery phrase',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const Text(
                  'This is a 12 word phrase you were given when you created previous wallet.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  'Learn more.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: null,
                  controller: recoveryPhraseTextFiledController,
                  decoration: const InputDecoration(
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
            child: !isloading
                ? CustomPrimaryButton(
                    insideText: 'Next',
                    backgroundColor: kPrimaryColor,
                    buttonHeight: 50,
                    buttonWidth: MediaQuery.of(context).size.width,
                    textColor: Colors.white,
                    press: () async {
                      setState(() {
                        isloading = true;
                      });

                      final result = await BlockchainService()
                          .restoreWalletFromMnemonic(
                              recoveryPhraseTextFiledController.text);

                      if (result == 'NO_IDEA') {
                        if (kDebugMode) {
                          print('RECOVERY PHRASE NOT MATCH');
                        }
                        setState(() {
                          isloading = false;
                        });
                      } else {
                        currentWallet.seedHex = result;
                        setState(() {
                          isloading = false;
                        });
                        await Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute<void>(
                            builder: (context) => const ProtectWallet(),
                          ),
                          ModalRoute.withName('/Home'),
                        );
                      }
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
