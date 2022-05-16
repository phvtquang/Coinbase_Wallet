import 'package:coinbaseclone/service/BlockchainService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get User Name from Mnemonics', () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().whenComplete(
      () {
        if (kDebugMode) {
          print('completed');
        }
      },
    );
    final String seed = BlockchainService().convertMnemonicToSeedHex(
        'inside laundry split decide piano pen turtle warrior situate ivory wrestle quick');
    var result = await BlockchainService().getUsername(seed);
    expect(result, 'oopapa');
  });

  test('Get Assets Amount of Specific Wallet', () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().whenComplete(
      () {
        if (kDebugMode) {
          print('completed');
        }
      },
    );
    final String seed = BlockchainService().convertMnemonicToSeedHex(
        'inside laundry split decide piano pen turtle warrior situate ivory wrestle quick');
    var result = await BlockchainService().getAssets(seed);
    expect(result, 100.214);
  });
}
