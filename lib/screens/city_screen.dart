import 'package:flutter/material.dart';
import 'package:foreweath/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
   var cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child:  TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                onChanged:(value){
                   cityname=value;
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),borderSide: BorderSide.none
                  ),
                  hintText: 'Enter the city name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if(cityname!=null){
                  Navigator.pop(context,cityname);
                }
              },
              child: const Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
