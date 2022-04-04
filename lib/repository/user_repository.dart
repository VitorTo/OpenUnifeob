
import 'package:dio/dio.dart';
import 'package:openeducacao/models/usuario_model.dart';

class UsuarioRepositor {
  final dio = Dio();
  final url = 'http://192.168.1.10/api-mobile/Controller/?id=1';

  Future<List<UsuarioModel>> fetchUsuario() async {
    final resposta = await dio.get(url);
    final list = resposta.data as List;

    List<UsuarioModel> usuarios = [];

    // for (var json in list) {
    //   // final user = UsuarioModel.fromJson(json); 
    //   // usuarios.add(user);
    // }

    return usuarios;
  }
}





// import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:json_annotation/json_annotation.dart';
// import 'package:http/http.dart' as http;

// class Usuario {

// static selectNome() async {
//     var response = await http.get(
//       Uri.parse(
//         //fazer id especifico 
//           'http://192.168.1.10/api-mobile/Controller/?id=1'),
//     );
//     if (response.statusCode != 200) throw Exception('Falha na comunicação com API');
//     var listdart = json.decode(response.body);

//     String _nome = listdart['nome'];
    
//     return _nome;
    
//   }


// }
