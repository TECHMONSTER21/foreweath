import 'package:flutter/material.dart';
import 'package:foreweath/screens/city_screen.dart';
import 'package:foreweath/services/weather.dart';
import 'package:foreweath/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationweather});
  final locationweather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String weatherMessage;
 late String cityName;






  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationweather);
  }

  updateUI(dynamic weaterData) {
    setState((){
      if (weaterData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to fetch weather data';
        // CityName='Unable to fetch';
        return;
      }
      temperature = weaterData['main']['temp'].toInt();
      weatherMessage = weather.getMessage(temperature);
      weatherIcon = weather.getWeatherIcon(weaterData['weather'][0]['id']);
      print(weaterData['weather'][0]['id']);
       cityName=weaterData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () async {
                    var weatherdata = await weather.getweatherlocation();
                    updateUI(weatherdata);
                  },
                  child: const Icon(
                    Icons.near_me,
                    size: 50.0,
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    var updatedcityname=await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityScreen();
                        },
                      ),
                    );
                    if(updatedcityname!=null)  {
                     var updateddata= await weather.getcityweather(updatedcityname);
                      updateUI(updateddata);
                    }
                  },
                  child: const Icon(
                    Icons.location_city,
                    size: 50.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    '$temperature°C',
                    style: const TextStyle(fontSize: 50.0),
                  ),
                  Text(
                    weatherIcon,
                    style: kConditionTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "$weatherIcon  in $cityName",
                textAlign: TextAlign.right,
                style: kMessageTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
