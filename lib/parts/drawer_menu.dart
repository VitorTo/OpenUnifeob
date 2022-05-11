import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/pages/tela_perfil.dart';
import 'package:openeducacao/pages/expansion_panel_list.dart';


class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userGoogle = FirebaseAuth.instance.currentUser!;
    final nomeUser = userGoogle.displayName!.split(" ");

    return Drawer(
      backgroundColor: Color(0xff46AEF7),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon( Icons.home, color: Colors.white, size: 30,),
            TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/principal');
            },
            child: Text('Página Inicial', style: TextStyle(fontSize: 25, color: Colors.white ),),
          ),
            ],           
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon( Icons.switch_video_rounded, color: Colors.white, size: 30,),
            TextButton(
            onPressed: () {

              Navigator.of(context).pushNamed('/enviarvideo');
            },
            child: Text('Enviar Vídeo', style: TextStyle(fontSize: 25, color: Colors.white ),),
          ),
            ],           
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon( Icons.playlist_play_rounded, color: Colors.white, size: 30,),
              TextButton(
            onPressed: () {

              Navigator.of(context).pushNamed('/perfil');
            },
            child: Text('Meus Vídeos', style: TextStyle(fontSize: 25, color: Colors.white ),),
          ),
            ],           
          ),
          SizedBox(height: 470,),
          Column(
            //tentar jogar no "end"
            children: [
               userGoogle == null
                ? OutlinedButton(
                    onPressed: () => context.read<AuthService>().logout(),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Botão logout
                        Padding(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          child: Text(
                            'Sair do app',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
                : OutlinedButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                    },
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xffEC615B),
                      shadowColor: Colors.red,
                      elevation: 1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Botão logout
                        Padding(
                          padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                          child: Text(
                            'Sair do app',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  )
            ],
          )


         
            
          ],
        ),

      ),
    );
  }
}
