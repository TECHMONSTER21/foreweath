import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foreweath/screens/location_screen.dart';
import 'package:foreweath/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
   late double longitude;
  late  double lattitude;

  @override
  void initState() {
    super.initState();
    getdatalocation();
  }

void getdatalocation() async {
    var weatherdata=await WeatherModel().getweatherlocation();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationweather: weatherdata,);
    }));
}



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
     child: SpinKitDoubleBounce(
       color: Colors.blueGrey,
       size: 100.0,
     ),
      ),
    );
  }
}
