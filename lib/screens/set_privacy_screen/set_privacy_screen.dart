import 'package:bip39/bip39.dart' as bip39;
import 'package:coinbaseclone/components/custom_primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/model/user_details.dart';
import 'package:coinbaseclone/model/wallet_details.dart';
import 'package:coinbaseclone/screens/backup_screen/show_recovery_phrase.dart';
import 'package:coinbaseclone/service/current_wallet.dart';
import 'package:coinbaseclone/service/fake_blockchain_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool public = true;

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            // Top Column Contain Back Arrow
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
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              // Bottom Column
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Set your privacy preferences',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'You can always change this later in Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ChoosePrivacySettings(),
                SizedBox(
                  // To make space between two button
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const Text(
                  'Crypto transactions take place on public blockchains. When your username is set to Public, advanced users can look up your addresses on the blockchain and view your transaction history.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  // To make space between two button
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                const CreateNewUserButton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateNewUserButton extends StatefulWidget {
  const CreateNewUserButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNewUserButton> createState() => _CreateNewUserButtonState();
}

class _CreateNewUserButtonState extends State<CreateNewUserButton> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return !isloading
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

              // BACKEND
              signupUserDetails.public = public;
              final String mnemonic = bip39.generateMnemonic();
              currentWallet.nmemonic = mnemonic;
              if (kDebugMode) {
                print(mnemonic);
              }
              newWalletForSignUp.seedHex = bip39.mnemonicToSeedHex(mnemonic);
              newWalletForSignUp.userName = signupUserDetails.username;
              signupUserDetails.seed = newWalletForSignUp.seedHex;
              currentWallet.seedHex = newWalletForSignUp.seedHex;
              await BlockchainService()
                  .createNewWallet(newWalletForSignUp, signupUserDetails);
              await BlockchainService().createNewUser(signupUserDetails);

              // CREATE DONE
              setState(() {
                isloading = false;
              });

              await Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute<void>(
                  builder: (context) => const ShowRecoveryPhrase(),
                ),
                ModalRoute.withName('/Home'),
              );
            })
        : const Center(
            child: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
  }
}

class ChoosePrivacySettings extends StatefulWidget {
  const ChoosePrivacySettings({Key? key}) : super(key: key);

  @override
  State<ChoosePrivacySettings> createState() => _ChoosePrivacySettingsState();
}

class _ChoosePrivacySettingsState extends State<ChoosePrivacySettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          // Public Button
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  if (!public) {
                    public = true;
                  }
                });
              },
              style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: public ? kPrimaryColor : Colors.grey,
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Public ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '   Recommended',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          // Space between Public and the bottom text
                          height: 5,
                        ),
                        const Text(
                          'Other Wallet users can search for my username and send me crypto',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Icon(
                      Icons.remove_red_eye,
                      color: public ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          // To make space between two button
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Center(
          // Private Button
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  if (public) {
                    public = false;
                  }
                });
              },
              style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: !public ? kPrimaryColor : Colors.grey,
                  )),
              child: Row(
                children: [
                  Flexible(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Private',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Other Wallet users cannot search for my username',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Icon(
                      Icons.privacy_tip,
                      color: !public ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
