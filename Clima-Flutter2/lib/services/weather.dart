import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const urlPrefix =  'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future getLocationWeather() async{
    Location loc = Location();
    await loc.getCurrentLocation();

    Networking networking = Networking('$urlPrefix?lat=${loc.latitude.toString()}&lon=' + loc.longitude.toString() + '&appid=51dd1c4c5c013a06bc008b60436d6aff');
    var decodedData = await networking.getData();

    return decodedData;
  }

  Future getCityWeather(city) async{
    Networking networking = Networking('$urlPrefix?q=$city&appid=51dd1c4c5c013a06bc008b60436d6aff');
    var decodedData = await networking.getData();

    return decodedData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
