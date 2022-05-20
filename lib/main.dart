import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:openeducacao/pages/info_videos.dart';
import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/services/auth_check.dart';
import 'package:provider/provider.dart';

import 'package:openeducacao/tela_inicio.dart';

import 'package:openeducacao/pages/tela_principal.dart';
import 'package:openeducacao/pages/tela_login.dart';
import 'package:openeducacao/pages/tela_perfil.dart';
import 'package:openeducacao/pages/enviar_video.dart';
import 'package:openeducacao/pages/detalhes_video.dart';
import 'package:openeducacao/pages/tela_video.dart';


import 'feed/feed_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      // TelaPrincipal(),
      // esse é o caminho original 
      InicioPage(), 
      // FeedPage(), 
      // AuthCheck(),
      // Expansiontile(),
      
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/enviarvideo': (BuildContext context) => EnviarVideo(),
        '/perfil': (BuildContext context) => TelaPerfil(),
        '/principal': (BuildContext contex) => TelaPrincipal(),
        // '/visualizarvideo': (BuildContext context) => TelaVideo(),
        '/detalhesvideo': (BuildContext context) => DetalhesVideo(),
        '/authcheck': (BuildContext context) => AuthCheck(),
        '/login': (BuildContext context) => Loginpage(),
        // "/infoVideo": (context) => InfoVideo(),
      },
    );
  }
}
