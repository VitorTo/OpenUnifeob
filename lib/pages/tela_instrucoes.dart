import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu.dart';

import '../feed/feed_youtube.dart';

class TelaInstrucoes extends StatefulWidget {

  const TelaInstrucoes( {Key? key }) : super(key: key);
  @override
  State<TelaInstrucoes> createState() => _TelaInstrucoesState();
}

class _TelaInstrucoesState extends State<TelaInstrucoes> {
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
              icon: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userGoogle == null?"https://freesvg.org/img/abstract-user-flat-3.png":userGoogle.photoURL!),
                      backgroundColor: Colors.black12,
                    )
                  ),
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
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Instruções',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 7,
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
                            // COLOCAR DADOS AQUI PLAYER
                            FeedYoutube(
                                    text: 'Instruções', videoId:'ei7kbQhK1hA').render(),
                            // COLOCAR DADOS AQUI PLAYER
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(children: <Widget>[
                                        Expanded(child: Divider()),

                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child:
                        Text(
                          'Conquistas', //nome do criador de conteudo
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),),
                        Container(
                            width: 340,
                            height: 200,
                            child: Image.asset('assets/images/explorador_card.png'),
                          ),
                
                          Container(
                            width: 340,
                            height: 200,
                            child: Image.asset('assets/images/aventureiro_card.png'),
                          ),
                          Container(
                            width: 340,
                            height: 200,
                            child: Image.asset('assets/images/desbravador_card.png'),
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
