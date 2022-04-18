import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu.dart';

class TelaVideo extends StatefulWidget {
  const TelaVideo({Key? key}) : super(key: key);

  @override
  State<TelaVideo> createState() => _TelaVideoState();
}

class _TelaVideoState extends State<TelaVideo> {
  @override
  Widget build(BuildContext context) {
    final userGoogle = FirebaseAuth.instance.currentUser!;
    final nomeUser = userGoogle.displayName!.split(" ");

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: TextButton(
          style: TextButton.styleFrom(
            alignment: Alignment.centerLeft,
            primary: Color(0xff46AEF7),
            textStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OpenEducação'),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color(0xff46AEF7),
        foregroundColor: Color(0xff46AEF7),
        actions: [
          Container(
            alignment: Alignment.center,
            child: userGoogle == null
                ? Text(
                    'seu nome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    nomeUser[0] + ' ' + nomeUser[1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: userGoogle == null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                      backgroundColor: Colors.black12,
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userGoogle.photoURL!),
                      backgroundColor: Colors.black12,
                    )),
        ],
      ),
      drawer: DrawerMenu(),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'titulo do vídeo quando insere muitas linhas ele joga para baixo automaticamente.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 5),
                                  child: Text(
                                    'Por',
                                  ),
                                ),
                                Text(
                                  'Vitor Gabriel',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            // colocar card aqui
                            SizedBox(
                              height: 15.0,
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/figma.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Bons Estudos!',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 360,
                            height: 360,
                            child: Image.asset('assets/images/final-video.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
