import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/set_privacy/set_privacy.dart';
import 'package:coinbaseclone/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PickUsername extends StatelessWidget {
  const PickUsername({Key? key}) : super(key: key);

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
          Column(
            // Middle Column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Text(
                  'Pick your username',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Text(
                  'This is how other Wallet users can find you and send you payments',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const UsernameInputBox(),
        ],
      ),
    );
  }
}

class UsernameInputBox extends StatefulWidget {
  const UsernameInputBox({
    Key? key,
  }) : super(key: key);

  @override
  State<UsernameInputBox> createState() => _UsernameInputBoxState();
}

class _UsernameInputBoxState extends State<UsernameInputBox> {
  Future<String> checkUser(String username) async {
    try {
      // Get reference to Firestore collection
      final collectionRef = FirebaseFirestore.instance.collection('userlist');
      final doc = await collectionRef.doc(username).get();
      if (kDebugMode) {
        print(doc.data());
      }
      if (doc.exists) {
        return 'UsernameExist';
      } else {
        return 'UsernameAvailable';
      }
    } catch (e) {
      return e.toString();
    }
  }

  final TextEditingController usernameTextFieldController =
      TextEditingController();

  String usernameAvailability = 'UsernameBlank';

  String finalizeResult(String input) {
    if (input == 'UsernameBlank') {
      return 'Username cannot be blank';
    }
    if (input == 'UsernameExist') {
      return 'Not available';
    }
    if (input == 'UsernameAvailable') {
      return 'Available';
    }
    return 'Sever Error';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              TextField(
                onChanged: (String value) async {
                  final String getUsernameAvailability =
                      await checkUser(usernameTextFieldController.text);
                  if (usernameTextFieldController.text.isEmpty) {
                    setState(() {
                      usernameAvailability = 'UsernameBlank';
                    });
                    return;
                  } else {
                    setState(() {
                      usernameAvailability = getUsernameAvailability;
                    });
                  }
                },
                controller: usernameTextFieldController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color.fromARGB(255, 249, 249, 249),
                  hintText: 'Type your username',
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    onPressed: usernameAvailability == 'UsernameBlank' ||
                            usernameAvailability == 'UsernameExist'
                        ? null
                        : () async {
                            if (await checkUser(
                                    usernameTextFieldController.text) !=
                                'UsernameAvailable') {
                              setState(() {
                                usernameAvailability = 'UsernameExist';
                              });
                              return;
                            } else {
                              signupUserDetails.username =
                                  usernameTextFieldController.text;
                              await Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const FourthScreen(),
                                ),
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Icon(
                  usernameAvailability == 'UsernameBlank' ||
                          usernameAvailability == 'UsernameExist'
                      ? Icons.warning
                      : Icons.check_circle,
                  color: usernameAvailability == 'UsernameBlank' ||
                          usernameAvailability == 'UsernameExist'
                      ? Colors.red
                      : Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  finalizeResult(usernameAvailability),
                  style: TextStyle(
                    color: usernameAvailability == 'UsernameBlank' ||
                            usernameAvailability == 'UsernameExist'
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
