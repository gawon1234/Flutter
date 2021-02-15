import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


class CoinData  {

  double usd_rate= 0;
  String api = '7A4F9448-EF32-40BC-8659-09A956598481';

  CoinData(){

  }

  Future getCoinData() async{

    String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$api';

    http.Response res = await http.get(url);
    print('print 00 -- ' + res.statusCode.toString() );
    if(res.statusCode == 200){

      //String data = res.body;
      String data = '{
          "time": "2021-02-13T06:39:07.9414840Z",
    "asset_id_base": "BTC",
    "asset_id_quote": "USD",
    "rate": 47647.184090683273256027048103
    }';
      print('print 33= ' + jsonDecode(data)['rate'].toString() + " // " + res.body.toString() );
      return jsonDecode(data)['rate'];
    }

    return 0;
  }


}
