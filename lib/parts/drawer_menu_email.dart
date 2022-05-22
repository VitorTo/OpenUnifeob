import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:openeducacao/services/auth_service.dart';


class DrawerMenuEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff46AEF7),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/principalemail');
                  },
                  child: Text(
                    'Página Inicial',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.switch_video_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/enviarvideoemail');
                  },
                  child: Text(
                    'Enviar Vídeo',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.playlist_play_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/perfilemail');
                  },
                  child: Text(
                    'Meus Vídeos',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 470,
            ),
            Column(
              //tentar jogar no "end"
              children: [
                OutlinedButton(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
