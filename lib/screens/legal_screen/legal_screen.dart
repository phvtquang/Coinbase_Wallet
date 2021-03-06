import 'package:coinbaseclone/components/custom_primary_button.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/pick_username_screen/pick_username_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({Key? key}) : super(key: key);

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
              width: MediaQuery.of(context).size.width,
              child: Column(
                // Top Column
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Legal',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'Please review the Coinbase Wallet Terms of Service and Privacy Policy.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              CustomOutlinedButton(
                insideText: 'Terms of Service',
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonHeight: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CustomOutlinedButton(
                insideText: 'Privacy Policy',
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonHeight: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomPrimaryButton(
                insideText: 'Accept',
                backgroundColor: kPrimaryColor,
                buttonHeight: 50,
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<void>(
                      builder: (context) => const PickUsername(),
                    ),
                  );
                },
              ),
              SizedBox(
                // bottom space
                height: MediaQuery.of(context).size.height * 0.02,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.insideText,
    required this.buttonHeight,
    required this.buttonWidth,
  }) : super(key: key);

  final String insideText;
  final double buttonHeight;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          elevation: 0,
          primary: Colors.black,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              insideText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
            ),
          ],
        ),
      ),
    );
  }
}
