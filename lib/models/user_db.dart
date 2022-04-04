// import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:json_annotation/json_annotation.dart';
// import 'package:http/http.dart' as http;
// import 'package:openeducacao/models/usuario_model.dart';


// class Usuario {

// List<UsuarioModel> data = [];

// static selectNome() async {
//     var response = await http.get(
//       Uri.parse(
//         //fazer id especifico 
//           'http://192.168.1.10/api-mobile/Controller/?id=1'),
//     );
//     if (response.statusCode != 200) throw Exception('Falha na comunicação com API');
//     var jsonbody = json.decode(response.body);
//     for (var db in jsonbody) {
//         UsuarioModel obj = new UsuarioModel.fromJson(db['id'], db['nome'], db['email'] );
//         UsuarioModel.add(obj);
//     }
//     // UsuarioModel.forEach(){}
    
//     return UsuarioModel;
    
//   }


// }

















// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:json_annotation/json_annotation.dart';
// import 'package:http/http.dart' as http;
// // import 'package:dio/dio.dart';
// // import 'package:openeducacao/models/usuario_model.dart';
// // class Usuario {
// selectNome() async {
    
// var response = await http.post("https://atividadeopenunifeob.000webhostapp.com/index.php?pnome=vitor&email=vitorteste@gmail.com&senha=122342",
//                 body: {'email': _email, 'senha': _password}
//                 );
// }
// //     if (response.statusCode != 200) throw Exception('Falha na comunicação com API');
// //     // var listdart = json.decode(response.body);

// //     // final resposta = await dio.get(url);
// //     final list = response.data as List;

// //     List<UsuarioModel> usuarios = [];

// //     for (var json in list) {
// //       final user = UsuarioModel.fromJson(json); 
// //       usuarios.add(user);
// //     }

// //     print(list);
    
// //     // return _nome;
    
// //   }


// // }