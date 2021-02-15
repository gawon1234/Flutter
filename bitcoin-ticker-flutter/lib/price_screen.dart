import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform ;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


double bitcoinValueInUSD = 0;

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = '';

  Future<void> getData() async {
    print("start11");
    double usd_rate = await CoinData().getCoinData();
    setState(() {
      bitcoinValueInUSD = usd_rate;
    });

  }



  DropdownButton getDropdownButton_android() { // andorid
    List<DropdownMenuItem> dropDownItems = [];
    for (String each in currenciesList) {
      dropDownItems.add(DropdownMenuItem(
        child: Text(each),
        value: each,
      ));
    }

    return DropdownButton(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (newValue) {
        setState(() {
          selectedCurrency = newValue;
        });
      },
    );
  }

  CupertinoPicker getDropdownButton_ios(){
    List<Text> dropDownItems = [];
    for (String each in currenciesList) {
      dropDownItems.add(Text(each));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlueAccent,
        itemExtent: 30,
        onSelectedItemChanged: (selectedValue) {
          print(selectedValue);
        },
        children: dropDownItems
    );
  }


  @override
  void initState() {
    print("start00");
    // TODO: implement initState
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = '+ bitcoinValueInUSD.toString() + 'USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isIOS ? getDropdownButton_ios() : getDropdownButton_android()
          ),
        ],
      ),
    );
  }
}

