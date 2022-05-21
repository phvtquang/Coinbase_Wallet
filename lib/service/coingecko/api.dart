import 'dart:convert';
import 'package:coinbaseclone/model/coin.dart';
import 'package:http/http.dart' as http;

const String COINGECKO_API_URL =
    'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

Future<List<Coin>> fetchCoin() async {
  final response = await http.get(
    Uri.parse(COINGECKO_API_URL),
  );

  final List<Coin> coinList = [];
  if (response.statusCode == 200) {
    List<dynamic> values = [];
    values = json.decode(response.body);
    if (values.isNotEmpty) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          final Map<String, dynamic> map = values[i];
          coinList.add(Coin.fromJson(map));
        }
      }
    }
    return coinList;
  } else {
    throw Exception('Failed to load coins');
  }
}
