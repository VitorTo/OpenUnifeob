import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/services/auth_check.dart';
import 'package:openeducacao/tela_inicio.dart';
import 'package:openeducacao/pages/tela_principal.dart';
import 'package:openeducacao/pages/enviar_video.dart';
import 'package:openeducacao/pages/detalhes_video.dart';
import 'package:openeducacao/pages/tela_video.dart';
import 'package:provider/provider.dart';

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
      home: AuthCheck(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/principal': (BuildContext contex) => TelaPrincipal(),
        '/enviarvideo': (BuildContext context) => EnviarVideo(),
        '/visualizarvideo': (BuildContext context) => TelaVideo(),
        '/detalhesvideo': (BuildContext context) => DetalhesVideo(),
        '/inicial': (BuildContext context) => InicioPage(),
      },
    );
  }
}
