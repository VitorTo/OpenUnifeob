import 'package:flutter/material.dart';
import 'package:openeducacao/enviar_video.dart';
import 'package:openeducacao/tela_cadastro.dart';
import 'package:openeducacao/tela_login.dart';
import 'package:openeducacao/tela_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
      routes: <String, WidgetBuilder>{
        '/landingpage' : (BuildContext context) => MyApp(),
        '/cadastro' : (BuildContext context) => TelaCadastro(),
        '/principal': (BuildContext contex) => TelaPrincipal(),
        '/enviarvideo': (BuildContext contex) => EnviarVideo(),

      },

    );
  }
}

