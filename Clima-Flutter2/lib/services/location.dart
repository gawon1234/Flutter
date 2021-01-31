import 'package:geolocator/geolocator.dart';

class Location{

  double latitude, longitude;

  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      //print("position = " + position.toString());
      this.latitude = position.latitude;
      this.longitude = position.longitude;

    }catch(e){
      print("error - no geo");
    }

  }

}

