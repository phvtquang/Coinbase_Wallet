import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/pincode_screen/pincode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProtectWallet extends StatelessWidget {
  const ProtectWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              'Protect your wallet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Text(
              'Add an extra layer of security to keep your crypto safe.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: 80,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.fingerprint,
                      color: kPrimaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Use Fingerprint',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Recommended',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: 80,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute<void>(
                        builder: (context) => const PincodeScreen(),
                      ),
                      ModalRoute.withName('/Home'));
                },
                style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key_sharp,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Create PIN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
