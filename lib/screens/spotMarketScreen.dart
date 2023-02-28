import 'dart:core';

import 'package:crypto_tracker/components/loading.dart';
import 'package:crypto_tracker/utilities/constants.dart';
import 'package:crypto_tracker/utilities/model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../services/reciever.dart';

class SpotMarketScreen extends StatefulWidget {
  const SpotMarketScreen({Key? key}) : super(key: key);

  @override
  State<SpotMarketScreen> createState() => _SpotMarketScreenState();
}

class _SpotMarketScreenState extends State<SpotMarketScreen> {
  // Stores the supported Currencies and Categories
  late List supportedCurrencies = [];
  late List supportedCategories = [];
  List<CryptoCurrency> cryptocurrency = [];
  late List cryptoData = [];

  String? dropdownValueCurr;
  String? dropdownValueCat;
  String? currentCurrency;
  String? currentCategory;

  DataHelper helper = DataHelper();

  @override
  Widget build(BuildContext context) {
    // Shows data once loaded
    return FutureBuilder(
      future: fetchData(1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return showData();
        } else {
          return getLoadingScreen();
        }
      },
    );
  }

  Scaffold showData() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SPOT MARKET",
                    style: headingStyle,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      paintCurrencyDropDown(),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight -
                        30,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return cryptoData[index];
                      },
                      itemCount: cryptoData.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paintCurrencyDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Currency",
          style: subHeadingStyle,
        ),
        const SizedBox(
          height: 6.0,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: supportedCurrencies
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: contentStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                dropdownValueCurr = value.toString();
                currentCurrency = dropdownValueCurr;
                print(currentCurrency);
              });
            },
            value: dropdownValueCurr,
            hint: const Text(
              "USD",
              style: contentStyle,
            ),
            buttonDecoration: dropDownButtonDecoration,
            buttonHeight: 30.0,
            buttonElevation: 10,
            itemHeight: 25,
            dropdownMaxHeight: 200.0,
            dropdownOverButton: false,
            dropdownDecoration: dropDownDecoration,
            dropdownScrollPadding:
                const EdgeInsets.only(top: 4.0, bottom: 15.0),
            scrollbarAlwaysShow: true,
            scrollbarRadius: const Radius.circular(17.0),
            scrollbarThickness: 3.0,
            isExpanded: false,
          ),
        )
      ],
    );
  }

  Widget paintCategoryDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Category",
          style: subHeadingStyle,
        ),
        const SizedBox(
          height: 6.0,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: supportedCategories
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e.toString().toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: contentStyle),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                dropdownValueCat = value.toString();
                currentCategory = dropdownValueCat;
                print(currentCategory);
              });
            },
            value: dropdownValueCat,
            hint: const Text(
              "ALL",
              style: contentStyle,
            ),
            buttonDecoration: dropDownButtonDecoration,
            buttonHeight: 30.0,
            buttonElevation: 10,
            itemHeight: 25,
            dropdownMaxHeight: 200.0,
            dropdownOverButton: false,
            dropdownDecoration: dropDownDecoration,
            dropdownScrollPadding:
                const EdgeInsets.only(top: 4.0, bottom: 15.0),
            scrollbarAlwaysShow: true,
            scrollbarRadius: const Radius.circular(17.0),
            scrollbarThickness: 3.0,
            isExpanded: false,
          ),
        )
      ],
    );
  }

  getCurrencyAndCategory() async {
    supportedCurrencies = await helper.getCurrency();

    List storeCategory;
    storeCategory = await helper.getCategory();

    for (var element in storeCategory) {
      supportedCategories.add(element["name"].toString());
    }
  }

  getCryptoData() async {
    List completeData;
    completeData = await helper.getCryptoData();

    for (var crypto in completeData) {
      cryptocurrency.add(
        CryptoCurrency(
          crypto["id"].toString(),
          crypto["symbol"].toString(),
          crypto["name"].toString(),
          crypto["image"].toString(),
          crypto["current_price"].toString(),
          crypto["market_cap"].toString(),
          crypto["total_volume"].toString(),
          crypto["high_24h"].toString(),
          crypto["low_24h"].toString(),
          crypto["price_change_24h"].toString(),
          crypto["price_change_percentage_24h"].toString(),
          crypto["last_updated"].toString(),
        ),
      );
    }
  }

  getCard() {}

  fetchData(int degree) async {
    if (degree == 1) {
      await getCurrencyAndCategory();

      await getCryptoData();
    } else if (degree == 2) {
      await getCryptoData();
    }
    return true;
  }
}
