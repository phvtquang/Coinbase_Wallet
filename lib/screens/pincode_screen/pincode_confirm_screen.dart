import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/main_screen/main_screen.dart';
import 'package:coinbaseclone/screens/pincode_screen/pincode_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PincodeScreenConfirm extends StatefulWidget {
  const PincodeScreenConfirm({Key? key, required this.rP}) : super(key: key);

  final String rP;
  @override
  State<PincodeScreenConfirm> createState() => _PincodeScreenConfirmState();
}

class _PincodeScreenConfirmState extends State<PincodeScreenConfirm> {
  String currentPass = '';

  @override
  Widget build(BuildContext context) {
    final String rightPass = widget.rP;
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
            child: Row(
              children: const [
                Spacer(),
                Text(
                  'Confirm your PIN',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                currentPass.isNotEmpty ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
              Icon(
                currentPass.length >= 2 ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
              Icon(
                currentPass.length >= 3 ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
              Icon(
                currentPass.length >= 4 ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
              Icon(
                currentPass.length >= 5 ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
              Icon(
                currentPass.length >= 6 ? Icons.circle : Icons.circle_outlined,
                color: kPrimaryColor,
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  KeypadButton(
                    insideText: '1',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '1';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '4',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '4';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '7',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '7';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  KeypadButton(
                    insideText: '2',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '2';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '5',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '5';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '8',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '8';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '0',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '0';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  KeypadButton(
                    insideText: '3',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '3';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '6',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '6';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '9',
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += '9';
                        if (kDebugMode) {
                          print(currentPass);
                        }
                        if (currentPass == rightPass) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const MainScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        } else if (currentPass.length == 6) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute<void>(
                              builder: (context) => const PincodeScreen(),
                            ),
                            ModalRoute.withName('/Home'),
                          );
                        }
                      });
                    },
                  ),
                  KeypadButton(
                    insideText: '<',
                    numberColor: Colors.black,
                    press: () {
                      setState(
                        () {
                          if (currentPass.isNotEmpty) {
                            currentPass = currentPass.substring(
                                0, currentPass.length - 1);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          )
        ],
      ),
    );
  }
}

class KeypadButton extends StatelessWidget {
  const KeypadButton({
    Key? key,
    required this.press,
    required this.insideText,
    required this.numberColor,
  }) : super(key: key);

  final VoidCallback press;
  final String insideText;
  final Color numberColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        insideText,
        style: TextStyle(
          color: numberColor,
          fontSize: 32,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
