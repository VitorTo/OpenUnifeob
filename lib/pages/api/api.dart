import'dart:async';
import'package:http/http.dart'as http;

const baseUrl="http://openeducacao.online/api";

class API {
  static Future getUsers(busca) {
    
    if(busca == null) {

      var url = baseUrl + "/selvideo.php";
      return http.get(Uri.parse(url));
      
    } else {
      
      var url = baseUrl + "/selvideo.php?busca="+busca;
      return http.get(Uri.parse(url));
      
    }
  }

  static Future getUsuario(email) {
    
    if(email == null) {

      return email;
      
    } else {
      
      var url = baseUrl + "/seliduser.php?email="+email;

      return http.get(Uri.parse(url));
      
    }
  }

}
