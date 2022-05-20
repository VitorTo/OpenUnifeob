import'dart:async';
import'package:http/http.dart'as http;

const baseUrl="https://atividadeopenunifeob.000webhostapp.com";

class API {
  static Future getUsers() {
    var url = baseUrl + "/selvideoprint.php";
    return http.get(Uri.parse(url));
  }

  static Future getBusca() {
    var url = baseUrl + "/selvideoprint.php";
    return http.get(Uri.parse(url));
  }
}
