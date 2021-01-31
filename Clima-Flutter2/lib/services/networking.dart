import 'package:http/http.dart' as http;
import 'dart:convert';


class Networking{

  double latitude, longitude;
  String url;

  Networking(this.url){

  }

  Future getData() async{
    var response = await http.get(url);

    if(response.statusCode == 200) {
      var decodedData =  jsonDecode(response.body) ;

      return decodedData;
    }
    else
      print("Fetching API ERROR");
  }

}