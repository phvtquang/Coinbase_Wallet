import 'package:coinbaseclone/components/primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/backup_screen/manualBackup2.dart';
import 'package:coinbaseclone/service/CurrentWallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class ManualBackup extends StatelessWidget {
  const ManualBackup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> mnemonicArray = currentWallet.nmemonic.split(' ');
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
          const Text('Write down recovery phrase'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 1,
                      word: mnemonicArray[0],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 2,
                      word: mnemonicArray[1],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 3,
                      word: mnemonicArray[2],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 4,
                      word: mnemonicArray[3],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 5,
                      word: mnemonicArray[4],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 6,
                      word: mnemonicArray[5],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 7,
                      word: mnemonicArray[6],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 8,
                      word: mnemonicArray[7],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 9,
                      word: mnemonicArray[8],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 10,
                      word: mnemonicArray[9],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 11,
                      word: mnemonicArray[10],
                    ),
                    RecoveryWordWithLeadingNumber(
                      leadingNumber: 12,
                      word: mnemonicArray[11],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 20,
                  ),
                  child: Text(
                    'Copy to clipboard',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          const Text(
            'Write these 12 words down, or copy them to a password manager.',
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          CustomPrimaryButton(
            insideText: 'Next',
            backgroundColor: kPrimaryColor,
            buttonHeight: MediaQuery.of(context).size.height * 0.065,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.white,
            press: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const ManualBackup2(),
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
