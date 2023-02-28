import 'networking.dart';

class DataHelper {
  Future<List> getCurrency() async {
    NetworkHelper currencies = NetworkHelper(
        "https://api.coingecko.com/api/v3/simple/supported_vs_currencies");

    return await currencies.getData();
  }

  Future<List> getCategory() async {
    NetworkHelper categories =
        NetworkHelper("https://api.coingecko.com/api/v3/coins/categories/list");

    return await categories.getData();
  }

  Future<List> getCryptoData() async {
    NetworkHelper data = NetworkHelper(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false");

    return await data.getData();
  }
}
