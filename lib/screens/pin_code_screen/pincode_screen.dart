import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/main_screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class pinCodeScreen extends StatefulWidget {
  const pinCodeScreen({Key? key}) : super(key: key);

  @override
  State<pinCodeScreen> createState() => _pinCodeScreenState();
}

// ignore: camel_case_types
class _pinCodeScreenState extends State<pinCodeScreen> {
  String currentPass = "";
  String rightPass = "55588";

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                const Text(
                  "Create PIN",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                currentPass.length >= 1 ? Icons.circle : Icons.circle_outlined,
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
                  keypad_button(
                    insideText: "1",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "1";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "4",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "4";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "7",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "7";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  keypad_button(
                    insideText: "2",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "2";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "5",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "5";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "8",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "8";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "0",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "0";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  keypad_button(
                    insideText: "3",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "3";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "6",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "6";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "9",
                    numberColor: Colors.black,
                    press: () {
                      setState(() {
                        currentPass += "9";
                        print(currentPass);
                        if (currentPass == rightPass) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        } else if (currentPass.length == 6) {
                          currentPass = "";
                        }
                      });
                    },
                  ),
                  keypad_button(
                    insideText: "<",
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

class keypad_button extends StatelessWidget {
  const keypad_button({
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
