import 'dart:convert';
import 'api.dart';
import '../tela_video.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/pages/api/user.dart';

class BuildListView extends StatefulWidget {
  @override
  createState() => _BuildListViewState();
}

class _BuildListViewState extends State {
  var users = <User>[];

  _getUsers() {
    API.getUsers(null).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
     _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
   build(context) {


    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        var urlInicio = "https://img.youtube.com/vi/";
        var codigo = users[index].link;
        var urlFim = "/0.jpg";
        var urlCompleta = urlInicio + codigo + urlFim;

          mostrarDetalhes(String link, String titulo, String descricao ) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TelaVideo(link: link, titulo:titulo, descricao: descricao),
            ),
          );
        }

        return ListTile(
            title: Column(
          children: <Widget>[
            Card(
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  mostrarDetalhes(users[index].link, users[index].titulo, users[index].descricao);
                  
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(urlCompleta),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 5),
                      child: Text(
                        users[index].titulo.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10),
                      child: Text(users[index].descricao.toLowerCase()),

                    ),
                        SizedBox(
                          height: 5,
                        ),
                  ],
                ),
              ),
            )
          ],
        ));
      },
    );
  }
}
