import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/pages/expansion_title.dart';
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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 0, 0), //const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                    child: userGoogle == null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                            backgroundColor: Colors.white,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(userGoogle.photoURL!),
                            backgroundColor: Colors.white,
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userGoogle == null
                          ? Text(
                              'Vitor Gabriel',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          : Text(
                              nomeUser[0] + ' ' + nomeUser[1],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Expansionpanel()));
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 25,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Expansiontile()));
                          },
                          icon: Text("Biografia",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70)),
                          label: Icon(
                            Icons.keyboard_arrow_down,
                            size: 35,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Conquistas',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                          child: Text(
                            "Explorador",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/explorador.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                          child: Text(
                            "Aventureiro",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/aventureiro.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Text(
                            "Desbravador",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/desbravador.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
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
        ),
      ),
    );
  }
}
