import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/auth_service.dart';
import 'package:openeducacao/enviar_video.dart';
import 'package:openeducacao/tela_principal.dart';
import 'package:openeducacao/services/auth_check.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/src/services/platform_channel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
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
      },
    );
  }
}
