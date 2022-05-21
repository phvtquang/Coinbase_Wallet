import 'package:bip39/bip39.dart' as bip39;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/model/user_details.dart';
import 'package:coinbaseclone/model/wallet_details.dart';
import 'package:coinbaseclone/service/user_assets.dart';
import 'package:coinbaseclone/utils/randomStringGenerator.dart';
import 'package:flutter/foundation.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class BlockchainService {
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  String convertMnemonicToSeedHex(String mnemonic) {
    return bip39.mnemonicToSeedHex(mnemonic);
  }

  Future<String> restoreWalletFromMnemonic(String mnemonic) async {
    final String inputSeed = bip39.mnemonicToSeedHex(mnemonic);
    final snapShot = await FirebaseFirestore.instance
        .collection('wallets')
        .doc(inputSeed)
        .get();

    if (!snapShot.exists) {
      if (kDebugMode) {
        print('SnapShot not exist');
      }
      return 'NO_IDEA';
    } else {
      if (kDebugMode) {
        print('Snapshot Exist');
      }
      return inputSeed;
    }
  }

  Future<void> createNewUser(UserDetails user) async {
    final userlistCollectionRef =
        FirebaseFirestore.instance.collection('userlist');
    await userlistCollectionRef.doc(user.username).set({
      'username': user.username,
      'public': user.public,
      'seedHex': user.seed,
    }).then(
      (value) {
        if (kDebugMode) {
          print('OK');
        }
      },
    );
  }

  Future<void> createNewWallet(
      WalletDetails wallet, UserDetails userDetails) async {
    // reference to "wallets" collection
    final walletsCollectionRef =
        FirebaseFirestore.instance.collection('wallets');

    // create a new document on firebase called 'username' contain username linking with that wallet
    await walletsCollectionRef.doc(wallet.seedHex).set({
      'username': userDetails.username,
    });

    for (int i = 0; i < coinSymbolList.length; i++) {
      await walletsCollectionRef
          .doc(wallet.seedHex)
          .collection('assets')
          .doc(coinSymbolList[i])
          .set({
        'address': getRandomString(30),
        'balance': 0.0,
      }).then(
        (value) {
          if (kDebugMode) {
            print('OK');
          }
        },
      );
    }
  }

  final walletsCollectionRef = FirebaseFirestore.instance.collection('wallets');

  Future<UserAssets> getAssets(String? seedHex) async {
    final UserAssets userAssets = UserAssets();

    final seedHexDocumentRef =
        walletsCollectionRef.doc(seedHex).collection('assets');

    for (int i = 0; i < coinSymbolList.length; i++) {
      final Coins coins = Coins();
      coins.name = coinSymbolList[i];
      final snapshot = await seedHexDocumentRef.doc(coinSymbolList[i]).get();
      //coins.address = await snapshot.get('address');
      coins.balance = await snapshot.get('balance');
      userAssets.listUsersCoins.add(coins);
    }
    return userAssets;
  }

  Future<String> getUsername(String? seedHex) async {
    // reference to "wallets" collection
    final walletsCollectionRef =
        FirebaseFirestore.instance.collection('wallets');

    // refrence to specific wallet in wallets collection
    final docRef = walletsCollectionRef.doc(seedHex);

    // get that documents snapshot
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final Map<String, dynamic>? data = docSnapshot.data();
      final username = data?['username'];
      return username;
    } else {
      return 'Error Getting Username';
    }
  }

  Future<double> getWalletTotalAssets(String? seedHex) async {
    double totalAssets = 0.toDouble();

    // reference to "wallets" collection
    final walletsCollectionRef =
        FirebaseFirestore.instance.collection('wallets');

    // refrence to specific wallet in wallets collection
    final docRef = walletsCollectionRef.doc(seedHex);

    // reference to assets in that specific wallet
    final assetRef = docRef.collection('assets');

    for (int i = 0; i < coinSymbolList.length; i++) {
      final docSnapshot = await assetRef.doc(coinSymbolList[i]).get();
      if (docSnapshot.exists) {
        final Map<String, dynamic>? data = docSnapshot.data();
        final balance = data?['balance'];
        totalAssets += balance;
      }
    }

    return totalAssets;
  }
}
