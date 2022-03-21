import 'package:coinbaseclone/components/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:coinbaseclone/constant.dart';

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
                Align(
                  alignment: Alignment.center,
                  child: primaryButton(
                      insideText: "Next",
                      backgroundColor: kPrimaryColor,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width,
                      textColor: Colors.white,
                      press: () {}),
                ),
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

class ChoosePrivacySettings extends StatefulWidget {
  const ChoosePrivacySettings({Key? key}) : super(key: key);

  @override
  State<ChoosePrivacySettings> createState() => _ChoosePrivacySettingsState();
}

class _ChoosePrivacySettingsState extends State<ChoosePrivacySettings> {
  bool privacy = true;

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
                  if (!privacy) {
                    privacy = true;
                  }
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    flex: 1,
                    child: Icon(
                      Icons.remove_red_eye,
                      color: privacy ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: privacy ? kPrimaryColor : Colors.grey,
                  )),
            ),
          ),
        ),
        SizedBox(
          // To make space between two button
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Center(
          // Public Button
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  if (privacy) {
                    privacy = false;
                  }
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    flex: 1,
                    child: Icon(
                      Icons.privacy_tip,
                      color: !privacy ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ],
              ),
              style: OutlinedButton.styleFrom(
                  elevation: 0,
                  primary: Colors.black,
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: !privacy ? kPrimaryColor : Colors.grey,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
