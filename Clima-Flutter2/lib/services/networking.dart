import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking{

  final String url;

  Networking(this.url){

  }

  Future<JsonDecoder> getData() async{

    var response = await http.get(this.url);

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      print("weather id = " + jsonResponse["weather"][0]["main"] );

      return jsonResponse;

    }else{
      print("failed");
    }

  }

}

