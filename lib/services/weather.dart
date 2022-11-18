import 'package:foreweath/location.dart';
import 'package:foreweath/services/networking.dart';
const api='8550ad072f36c1c149e013201fa53b35';

class WeatherModel {

  Future<dynamic> getcityweather(String city){
    Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric');
    var rawData=networking.getdatafromurl();
    return rawData;
  }

  Future<dynamic> getweatherlocation() async{
    Location location= Location();
    await location.getCurrentlocation();
    Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');
     var rawData=networking.getdatafromurl();
      return rawData;
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
