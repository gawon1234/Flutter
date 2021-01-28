import 'package:geolocator/geolocator.dart';



class Location {

  double latitude, longitude;

  Future<void> getCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
      this.latitude = position.latitude;
      this.longitude = position.longitude;

      print(position);
    }catch(e){
      print("ERROR!!!!");
    }

  }
}