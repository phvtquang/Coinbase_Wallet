import 'package:coinbaseclone/constant.dart';
import 'package:coinbaseclone/service/current_wallet.dart';
import 'package:coinbaseclone/service/fake_blockchain_service.dart';
import 'package:flutter/material.dart';

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
        const Center(
          child: MainTab(),
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

class MainTab extends StatefulWidget {
  const MainTab({
    Key? key,
  }) : super(key: key);

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  late Future<String> futureUsername;
  late Future<double> futureTotalAssets;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureUsername = BlockchainService().getUsername(currentWallet.seedHex);
    futureTotalAssets =
        BlockchainService().getWalletTotalAssets(currentWallet.seedHex);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              FutureBuilder<String>(
                future: futureUsername,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  String username = snapshot.data.toString();

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasData) {
                        return Text(
                          '@$username',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        username = 'HAS Error';
                      } else {
                        username = 'else';
                      }
                  }
                  return Container();
                },
              ),
              FutureBuilder<double>(
                future: futureTotalAssets,
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  String? finalTotalAssets = snapshot.data.toString();

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasData) {
                        return Text(
                          '$finalTotalAssets\$',
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        finalTotalAssets = 0.toString();
                      } else {
                        finalTotalAssets = 0.toString();
                      }
                  }
                  return Container();
                },
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
                      '  Send',
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
                      'Receive',
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
                      'Trade  ',
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
                      width: 4,
                      color: kPrimaryColor,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Coins',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'NFTs',
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
                            const Text('ACTIONS'),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return const ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text('Buy, transfer or convert'),
                                  subtitle: Text('From Coinbase or else where'),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: 2,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                            const Text('BALANCE'),
                            ListView.builder(
                              itemBuilder: (context, index) {
                                return const ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                  ),
                                  title: Text('Bitcoin'),
                                  subtitle: Text('BTC'),
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
