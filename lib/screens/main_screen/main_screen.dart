import 'dart:async';
import 'dart:convert';

import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/main_screen/browser_page.dart';
import 'package:coinbaseclone/screens/main_screen/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'coinDetail.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = [
    const WalletPage(),
    const BrowserPage(),
    const SettingPage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}

class WalletPage extends StatelessWidget {
  const WalletPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kPrimaryColor,
          height: MediaQuery.of(context).size.height * 0.43,
        ),
        const Align(
          alignment: Alignment.center,
          child: mainTab(),
        ),
        const Positioned(
          right: 25,
          top: 45,
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 0, 60, 255),
            child: Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class mainTab extends StatefulWidget {
  const mainTab({
    Key? key,
  }) : super(key: key);

  @override
  State<mainTab> createState() => _mainTabState();
}

class _mainTabState extends State<mainTab>
    with AutomaticKeepAliveClientMixin<mainTab> {
  @override
  bool get wantKeepAlive => true; // ** and here

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                "@Feb25",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Text(
                "\$3,429.24",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(158, 0, 81, 221),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "  Send",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalDivider(
                      color: Color.fromARGB(132, 241, 240, 240),
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text(
                      "Receive",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    VerticalDivider(
                      color: Color.fromARGB(132, 241, 240, 240),
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text(
                      "Trade  ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.559,
          width: MediaQuery.of(context).size.width * 0.95,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4.0,
                      color: kPrimaryColor,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "Coins",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "NFTs",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: 20,
                            ),
                            const Text("ACTIONS"),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return const ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text("Buy, transfer or convert"),
                                  subtitle: Text("From Coinbase or else where"),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: 2,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                            const Text("BALANCE"),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return const ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text("Buy, transfer or convert"),
                                  subtitle: Text("From Coinbase or else where"),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: 10,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
