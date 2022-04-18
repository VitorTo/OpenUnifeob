import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu.dart';

class DetalhesVideo extends StatefulWidget {
  const DetalhesVideo({Key? key}) : super(key: key);

  @override
  State<DetalhesVideo> createState() => _DetalhesVideoState();
}

class _DetalhesVideoState extends State<DetalhesVideo> {
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
                                'titulo do vídeo quando insiro muitas linhas ele joga para baixo automaticamente.',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Figma é um editor gráfico de vetor e prototipagem de projetos de design baseado principalmente no navegador web.',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'O que você vai aprender?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum proin nunc erat cursus porta condimentum integer vivamus vitae.'),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Criador de conteúdo',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Column(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      // Navigator.of(context).pushNamed('perfilcriador');
                                                    },
                                                    icon: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: NetworkImage(
                                                          "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                                                      backgroundColor:
                                                          Colors.black12,
                                                    )),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(20),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Leonardo Messi',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(height: 5),
                                                            Text(
                                                                'Análise e Desenvolvimento'),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // const Icon(Icons.check),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Quero Assistir',
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ])),
                          ],
                        ),
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
