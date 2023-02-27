import 'package:crypto_tracker/services/networking.dart';
import 'package:crypto_tracker/utilities/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SpotMarketScreen extends StatefulWidget {
  const SpotMarketScreen({Key? key}) : super(key: key);

  @override
  State<SpotMarketScreen> createState() => _SpotMarketScreenState();
}

class _SpotMarketScreenState extends State<SpotMarketScreen> {
  // Stores the supported Currencies and Categories
  late List supportedCurrencies = [];
  late List supportedCategories = [];
  late List cryptoData = [];

  String? dropdownValueCurr;
  String? dropdownValueCat;
  String? currentCurrency;
  String? currentCategory;

  @override
  Widget build(BuildContext context) {
    // Shows data once loaded
    return FutureBuilder(
      future: fetchData(1),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data != null) {
          return showData();
        } else {
          return loading();
        }
      },
    );
  }

  // Loading Screen
  Scaffold loading() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "SPOT MARKET",
                  style: headingStyle,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.white,
                    size: 22.0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Zooooooop!\nGetting Your Data",
                    style: subHeadingStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                      // Expanded(
                      //   flex: 1,
                      //   child: paintCategoryDropDown(),
                      // ),
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
        Text(
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

  // Widget paintDropDown(String title, List items, String hint) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Text(
  //         title,
  //         style: subHeadingStyle,
  //       ),
  //       const SizedBox(
  //         height: 6.0,
  //       ),
  //       DropdownButtonHideUnderline(
  //         child: DropdownButton2(
  //           items: items
  //               .map(
  //                 (e) => DropdownMenuItem(
  //                   value: e,
  //                   child: Text(e.toString().toUpperCase(),
  //                       overflow: TextOverflow.ellipsis,
  //                       maxLines: 1,
  //                       style: contentStyle),
  //                 ),
  //               )
  //               .toList(),
  //           onChanged: (value) {
  //             setState(() {
  //               title == "Currency"
  //                   ? dropdownValueCurr = value.toString()
  //                   : dropdownValueCat = value.toString();
  //
  //               title == "Currency"
  //                   ? currentCurrency = dropdownValueCurr
  //                   : currentCategory = dropdownValueCat;
  //               print(currentCurrency);
  //             });
  //           },
  //           value: title == "Currency" ? dropdownValueCurr : dropdownValueCat,
  //           hint: Text(
  //             hint,
  //             style: contentStyle,
  //           ),
  //           buttonDecoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(34.0),
  //               border: stopFullGradientBorder),
  //           buttonHeight: 30.0,
  //           buttonElevation: 10,
  //           itemHeight: 25,
  //           dropdownMaxHeight: 200.0,
  //           dropdownOverButton: false,
  //           dropdownDecoration: BoxDecoration(
  //             color: Colors.black,
  //             border: stopFullGradientBorder,
  //             borderRadius: BorderRadius.circular(34.0),
  //           ),
  //           dropdownScrollPadding:
  //               const EdgeInsets.only(top: 4.0, bottom: 15.0),
  //           scrollbarAlwaysShow: true,
  //           scrollbarRadius: const Radius.circular(17.0),
  //           scrollbarThickness: 3.0,
  //           isExpanded: false,
  //         ),
  //       )
  //     ],
  //   );
  // }

  getCurrencyAndCategory() async {
    // Fetching Supported currencies
    NetworkHelper currencies = NetworkHelper(
        "https://api.coingecko.com/api/v3/simple/supported_vs_currencies");
    supportedCurrencies = await currencies.getData();

    //Fetching Supported Categories
    List storeCategory;
    NetworkHelper categories =
        NetworkHelper("https://api.coingecko.com/api/v3/coins/categories/list");
    storeCategory = await categories.getData();

    for (var element in storeCategory) {
      print(element["name"].toString());
      supportedCategories.add(element["name"].toString());
    }
  }

  getCryptoData() async {
    List completeData;
    NetworkHelper data = NetworkHelper(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false");
    completeData = await data.getData();
    print(completeData);

    for (var element in completeData) {
      cryptoData.add(Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  element["symbol"].toString().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Volume : ${element["total_volume"].toString()}",
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white24,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  element["current_price"].toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  element["price_change_percentage_24h"].toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    }
  }

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
