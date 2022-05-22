import'dart:async';
import'package:http/http.dart'as http;

const baseUrl="https://atividadeopenunifeob.000webhostapp.com";

class API {
  static Future getUsers() async {
     var url = await baseUrl + "/selvideoprint.php";
    return http.get(Uri.parse(url));
  }

  static Future getBusca(busca) {
    var url = baseUrl + "/selvideo.php?busca="+busca;
    return http.get(Uri.parse(url));
  }
}
