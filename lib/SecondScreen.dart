import 'package:coinbaseclone/ThirdScreen.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // Main Column
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // Make things divided well on screen
        children: [
          Column(
            // Top Column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // Contain the back button
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                // Legal Text
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Legal',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                // Please review text
                padding: EdgeInsets.only(left: 16.0, top: 0, right: 16),
                child: Text(
                  'Please review the Coinbase Wallet Terms of Service and Privacy Policy.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                // Terms of Service
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Terms of Service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      onPrimary: Colors.black,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                // Privacy Policy
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 80,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      onPrimary: Colors.black,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Padding(
                // Accept Button
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdScreen()));
                      },
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
