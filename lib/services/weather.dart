import 'package:foreweath/location.dart';
import 'package:foreweath/services/networking.dart';
import 'package:geolocator/geolocator.dart';
const api='8550ad072f36c1c149e013201fa53b35';

class WeatherModel {

  Future<dynamic> getcityweather(String city){
    Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric');
    var rawData=networking.getdatafromurl();
    return rawData;
  }

  Future<dynamic> getweatherlocation() async{
    Location location= Location();
    // print('Location');
    LocationPermission permissionstatus;
    permissionstatus = await Geolocator.checkPermission();
    if (permissionstatus == LocationPermission.denied) {
      permissionstatus = await Geolocator.requestPermission();
      if (permissionstatus == LocationPermission.deniedForever) {
        return ('Location Not Available');
      }
    }
     await location.getCurrentlocation();
    print('getcurrentlocation');
    Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');
     var rawData=networking.getdatafromurl();
      return rawData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ';
    } else if (condition < 700) {
      return 'โ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ';
    } else if (condition <= 804) {
      return 'โ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
