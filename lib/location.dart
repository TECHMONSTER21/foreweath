import 'package:geolocator/geolocator.dart';

class Location{
  Location();
   late double latitude;
   late double longitude;

  Future<void> getCurrentlocation() async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
      print(latitude);
      print(longitude);
    }catch(e){
      print(e);
    }
  }
}
