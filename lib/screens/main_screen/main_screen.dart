import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/screens/main_screen/browser_page.dart';
import 'package:coinbaseclone/screens/main_screen/setting_page.dart';
import 'package:coinbaseclone/screens/main_screen/walletPage.dart';
import 'package:coinbaseclone/service/BlockchainService.dart';
import 'package:coinbaseclone/service/CurrentWallet.dart';
import 'package:coinbaseclone/service/UserAssets.dart';
import 'package:ethers/ethers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

//var userAssets = BlockchainService().getAssets(currentWallet.seedHex);

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
    //BlockchainService().getAssets(currentWallet.seedHex);
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
