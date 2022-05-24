
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu_email.dart';
import '../feed/feed_youtube.dart';

class TelaVideoEmail extends StatefulWidget {
  String link;
  String titulo;
  String descricao;

  TelaVideoEmail(
      {Key? key,
      required this.link,
      required this.titulo,
      required this.descricao})
      : super(key: key);
  @override
  State<TelaVideoEmail> createState() => _TelaVideoEmailState();
}

class _TelaVideoEmailState extends State<TelaVideoEmail> {
  @override
  Widget build(BuildContext context) {

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
              child: Text(
                'seu nome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                     "https://freesvg.org/img/abstract-user-flat-3.png"
                    ),
                backgroundColor: Colors.black12,
              )),
        ],
      ),
      drawer: DrawerMenuEmail(),
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.titulo.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black87),
                            ),
                            // COLOCAR DADOS AQUI PLAYER
                            FeedYoutube(
                                    text: widget.titulo, videoId: widget.link)
                                .render(),
                            // COLOCAR DADOS AQUI PLAYER
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(),
                                        child: Text(widget.descricao),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Bons Estudos!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
