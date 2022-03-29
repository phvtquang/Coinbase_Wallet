import 'package:coinbaseclone/components/primaryButton.dart';
import 'package:coinbaseclone/screens/third_screen/ThirdScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:coinbaseclone/constant.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: const EdgeInsets.only(left: 15.0, right: 10.0),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customOutlinedButton(
                insideText: "Terms of Service",
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonHeight: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              customOutlinedButton(
                insideText: "Privacy Policy",
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonHeight: 80,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              primaryButton(
                insideText: "Accept",
                backgroundColor: kPrimaryColor,
                buttonHeight: 50,
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ThirdScreen(),
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

// ignore: camel_case_types
class customOutlinedButton extends StatelessWidget {
  const customOutlinedButton({
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
        style: OutlinedButton.styleFrom(
          elevation: 0,
          primary: Colors.black,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
