// import 'dart:html';

// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu.dart';

class EnviarVideo extends StatefulWidget {
  const EnviarVideo({Key? key}) : super(key: key);

  @override
  _EnviarVideoState createState() => _EnviarVideoState();
}

class _EnviarVideoState extends State<EnviarVideo> {
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
            textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,),
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
                    nomeUser[0],
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10)),
                      const Text(
                        'Enviar Vídeo',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Respond to button press
                        },
                        label:
                            Text("Instruções", style: TextStyle(fontSize: 13)),
                        icon: Icon(
                          Icons.play_arrow,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      // Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                                'Para enviar seu video você precisa inserir esses campos abaixo e clicar no botão Enviar.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Titulo',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15.5,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Descrição',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15.5,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'O que as pessoas vão aprender',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15.5,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'URL do Vídeo do YouTube',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15.5,
                            ),
                            SizedBox(
                              width: 360,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/principal');
                                },
                                child: const Text(
                                  "Enviar",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                              child: Column(
                                children: [
                                  Text(
                                    'O que devo fazer depois de enviar o vídeo?',
                                    style: TextStyle(
                                      fontSize: 16.3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      'Para enviar seu video você precisa inserir esses campos abaixo e clicar no botão Enviar'),
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
                            child:
                                Image.asset('assets/images/depois-video.png'),
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
