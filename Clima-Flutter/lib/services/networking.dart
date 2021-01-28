import 'package:http/http.dart' as http;
import 'dart:convert';


class Networking {

  final String url;
  double latitude, longitude;
  String apikey;

  Networking(this.url){

  }

  Future getData(latitude, longitude, apikey) async{

    http.Response res =  await http.get(this.url );
    print(res.body);

    if(res.statusCode == 200){
      String data = res.body;

      return  jsonDecode(data);

    }else{
      print(res.statusCode);
    }
  }

}