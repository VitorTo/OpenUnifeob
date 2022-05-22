import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/services/auth_check.dart';
import 'package:provider/provider.dart';

import 'package:openeducacao/tela_inicio.dart';
import 'package:openeducacao/pages/tela_login.dart';
import 'package:openeducacao/pages/recuperar.dart';

//Login email
import 'package:openeducacao/pages/tela_principal_email.dart';
import 'package:openeducacao/pages/tela_perfil_email.dart';
import 'package:openeducacao/pages/tela_instrucoes_email.dart';
import 'package:openeducacao/pages/enviar_video_email.dart';

//Login google
import 'package:openeducacao/pages/tela_principal.dart';
import 'package:openeducacao/pages/tela_perfil.dart';
import 'package:openeducacao/pages/tela_instrucoes.dart';
import 'package:openeducacao/pages/enviar_video.dart';



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

      home:  InicioPage(), 

      routes: <String, WidgetBuilder>{
        
        //Verificações usuario
        '/login': (BuildContext context) => Loginpage(),
        '/recuperar': (BuildContext context) => TelaRecuperacaoSenha(),
        '/authcheck': (BuildContext context) => AuthCheck(),

        //Páginas com login google
        '/enviarvideo': (BuildContext context) => EnviarVideo(),
        '/perfil': (BuildContext context) => TelaPerfil(),
        '/principal': (BuildContext contex) => TelaPrincipal(),
        '/telainstrucoes': (BuildContext context) => TelaInstrucoes(),
        
        //Paginas sem login google
        '/enviarvideoemail': (BuildContext context) => EnviarVideoEmail(),
        '/perfilemail': (BuildContext context) => TelaPerfilEmail(),
        '/principalemail': (BuildContext contex) => TelaPrincipalEmail(),
        '/telainstrucoesemail': (BuildContext context) => TelaInstrucoesEmail(),
        
      },
    );
  }
}
