import 'package:coinbaseclone/components/custom_primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/pincode_screen/pincode_screen.dart';
import 'package:coinbaseclone/service/current_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ManualBackup2 extends StatelessWidget {
  const ManualBackup2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tạo 1 list các textfieldController để sử dụng ở các textField
    final List<TextEditingController> listOfTextFieldControllrer = [];
    for (int i = 0; i < 12; i++) {
      listOfTextFieldControllrer.add(TextEditingController());
    }
    // Giao diện Widget
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
          const Text('Write words in correct order'),

          /*
          // Phần này tạm thời để đó, sẽ code sau để đúng chuẩn với app gốc
          
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            color: Colors.grey.shade200,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
          */

          // Tạm thời dùng đoạn code đây thể hiện giao diện nhập 12 ký tự
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 1,
                textEditingController: listOfTextFieldControllrer[0],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                  leadingNumber: 2,
                  textEditingController: listOfTextFieldControllrer[1]),
              MnemonicWordTextFieldWithLeadingNumber(
                  leadingNumber: 3,
                  textEditingController: listOfTextFieldControllrer[2]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 4,
                textEditingController: listOfTextFieldControllrer[3],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 5,
                textEditingController: listOfTextFieldControllrer[4],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                  leadingNumber: 6,
                  textEditingController: listOfTextFieldControllrer[5]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 7,
                textEditingController: listOfTextFieldControllrer[6],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 8,
                textEditingController: listOfTextFieldControllrer[7],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 9,
                textEditingController: listOfTextFieldControllrer[8],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 10,
                textEditingController: listOfTextFieldControllrer[9],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                leadingNumber: 11,
                textEditingController: listOfTextFieldControllrer[10],
              ),
              MnemonicWordTextFieldWithLeadingNumber(
                  leadingNumber: 12,
                  textEditingController: listOfTextFieldControllrer[11]),
            ],
          ),
          const Spacer(),
          CustomPrimaryButton(
            insideText: 'Next',
            backgroundColor: kPrimaryColor,
            buttonHeight: MediaQuery.of(context).size.height * 0.065,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            textColor: Colors.white,
            press: () {
              String mnemonicInput = '';
              for (int i = 0; i < 12; i++) {
                if (i == 0) {
                  mnemonicInput += listOfTextFieldControllrer[i].text;
                } else {
                  mnemonicInput =
                      mnemonicInput + ' ' + listOfTextFieldControllrer[i].text;
                }
              }
              if (kDebugMode) {
                print(mnemonicInput);
                print(currentWallet.nmemonic);
              }
              if (mnemonicInput == currentWallet.nmemonic) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const PincodeScreen(),
                  ),
                );
              } else {}
            },
          ),
        ],
      ),
    );
  }
}

class MnemonicWordTextFieldWithLeadingNumber extends StatelessWidget {
  const MnemonicWordTextFieldWithLeadingNumber({
    Key? key,
    required this.leadingNumber,
    required this.textEditingController,
  }) : super(key: key);

  final int leadingNumber;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Row(
          children: [
            Text(
              leadingNumber.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text('  '),
            Expanded(
              child: TextField(
                controller: textEditingController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
