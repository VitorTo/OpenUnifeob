import 'dart:convert';
import 'api.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/pages/api/user.dart';
import 'package:openeducacao/pages/tela_video_email.dart';

class BuildListViewEmail extends StatefulWidget {
  @override
  createState() => _BuildListViewEmailState();
}

class _BuildListViewEmailState extends State {
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
              builder: (_) => TelaVideoEmail(link: link, titulo:titulo, descricao: descricao),
            ),
          );
        }

        return ListTile(
            title: Column(
          children: <Widget>[
            Card(
              semanticContainer: true,
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  mostrarDetalhes(users[index].link, users[index].titulo, users[index].descricao);
                  // Navigator.of(context).pushNamed('/detalhesvideo');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(urlCompleta),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        users[index].titulo,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(users[index].descricao),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                      ],
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
