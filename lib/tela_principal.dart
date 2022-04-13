// import 'dart:html';

// ignore_for_file: deprecated_member_use

import 'dart:ui';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:openeducacao/controllers/usuario_controller.dart';
// import 'package:openeducacao/models/user_db.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:openeducacao/expansion_panel_list.dart';
import 'package:openeducacao/expansion_title.dart';
import 'package:provider/provider.dart';
// import 'package:openeducacao/repositor/user_repository.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);


  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
    
  Widget build(BuildContext context) {
    final userGoogle = FirebaseAuth.instance.currentUser!; //usa pra pegar imagem quando login google

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "OpenEducação",
          style: TextStyle(
            color: Color(0xff46AEF7),
          ),
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.white,
        shadowColor: Color(0xff46AEF7),
        foregroundColor: Color(0xff46AEF7),
        actions: [
          Container(
            alignment: Alignment.center,
            child: 
            userGoogle == null 
            ?
            Text(
               'vitor',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            )
            :
            Text(
               userGoogle.displayName!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/enviarvideo');
            },
            icon: userGoogle == null 
            ?
            CircleAvatar(
              radius: 20,
              // backgroundImage: NetworkImage(user.photoURL!),
              backgroundImage: NetworkImage("https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
              backgroundColor: Colors.black12,
            ) 
            :
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(userGoogle.photoURL!),
              // backgroundImage: NetworkImage("https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
              backgroundColor: Colors.black12,
            ) 

          ),
        ],
      ),
      //-----           ----------      INICIO DRAWER       -----------      ---------
      drawer: Drawer(
        backgroundColor: Color(0xff46AEF7),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                          'Vitor Gabriel',
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
                    SizedBox(height: 40,),
                    Column(
                      children: [
                        Text(
                          'Conquistas',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 20,),
                        OutlinedButton.icon(
                          icon: Text(
                            "Explorador        ",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white,),
                          ),
                          label: Image.asset(
                            "assets/images/explorador.png",
                            width: 100.0,
                            height: 60.0,
                          ),
                           onPressed: () {  },
                        ),
                        SizedBox(height: 10,),
                        OutlinedButton.icon(
                          icon: Text(
                            "Aventureiro        ",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white,),
                          ),
                          label: Image.asset(
                            "assets/images/aventureiro.png",
                            width: 100.0,
                            height: 60.0,
                          ),
                           onPressed: () {  },
                        ),
                        SizedBox(height: 10,),
                        OutlinedButton.icon(
                          icon: Text(
                            "Desbravador        ",
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.white,),
                          ),
                          label: Image.asset(
                            "assets/images/desbravador.png",
                            width: 100.0,
                            height: 60.0,
                          ),
                           onPressed: () {  },
                        ),

                      ],
                    ),
                    SizedBox(height: 130,),
                    
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => context.read<AuthService>().logout(),
                style: OutlinedButton.styleFrom(
                  primary: Colors.red,
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
              ),
            ],
          ),
        ),
      ),
      // -----      -------   FIM DRAWER      -----         --------
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
                        'Área do aluno',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
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
                    height: 20,
                  ),
                  Column(
                    children: [
                      // Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          // scrollPadding: const EdgeInsets.all(20.0),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(20.0),
                            labelText: 'O que você está procurando?',
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                                color: Color(0xff46AEF7),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10)),
                      Column(
                        children: [
                          Text(
                            'Escolher',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Selecione um curso '),
                          Text('que você se interessou.'),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/images/escolher.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'Assistir',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Assista ao curso'),
                          Text('que você escolheu.'),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/images/assistir.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    Row(
                      children: [
                        Text('Vídeos',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 150,
                        ),
                        Text(
                          'Filtrar',
                          style: TextStyle(color: Color(0xff46AEF7)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.filter_list,
                              color: Color(0xff46AEF7),
                            ))
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/figma.png',
                            fit: BoxFit.cover,
                          ),
                          ListTile(
                            title: const Text(
                              'Como utilizar plugins no Figma',
                            ),
                            subtitle: Text(
                              'Figma é um editor gráfico de vetor e prototipagem de projetos de design baseado principalmente no navegador web...',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                    child: Column(
                      children: [
                        Text(
                          'Você será redirecionado para uma página',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'onde poderá descrever o seu problema.',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 200.0,
                    height: 80.0,
                    child: OutlineButton(
                      child: Text('Reportar',
                          style: TextStyle(
                              color: Color(0xff46AEF7), fontSize: 20)),
                      borderSide: BorderSide(
                        color: Color(0xff46AEF7),
                        style: BorderStyle.solid,
                        width: 1.8,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
