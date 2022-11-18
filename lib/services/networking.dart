import 'package:http/http.dart';
import 'dart:convert';

class Networking{
  Networking(this.url);
  final String url;

  Future  getdatafromurl() async {
    Response response= await get(Uri.parse(url));
    if(response.statusCode==200){
      String rawdata=response.body;
      return jsonDecode(rawdata);
    }else{
      print(response.statusCode);
    }
  }
}