import 'package:flutter/material.dart';
import 'package:openeducacao/pages/tela_login.dart';
import 'package:openeducacao/pages/tela_principal.dart';
import 'package:openeducacao/pages/tela_principal_email.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading){

      return loading();
    } else if (auth.usuario == null){

      return Loginpage();
    } else {
      if(auth.usuario?.displayName == null ){

        return TelaPrincipalEmail();
      } else {

      return TelaPrincipal();
      }
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
