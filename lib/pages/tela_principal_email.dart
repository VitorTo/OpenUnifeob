
import 'package:openeducacao/pages/api/build_list_view_email.dart';
import 'package:openeducacao/pages/tela_perfil_email.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu_email.dart';


class TelaPrincipalEmail extends StatefulWidget {
  const TelaPrincipalEmail({Key? key}) : super(key: key);

  @override
  _TelaPrincipalEmailState createState() => _TelaPrincipalEmailState();
}


class _TelaPrincipalEmailState extends State<TelaPrincipalEmail> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: TextButton(
          style: TextButton.styleFrom(
            // alignment: Alignment.,
            primary: Color(0xff46AEF7),
            textStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
          child: Text('OpenEducação'),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color(0xff46AEF7),
        foregroundColor: Color(0xff46AEF7),
        actions: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
                   'seu nome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                
          ),
          IconButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute(builder: (BuildContext context) => TelaPerfilEmail()));
              },
              icon: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage( "https://freesvg.org/img/abstract-user-flat-3.png"),//PODE COLOCAR DENTRO
                      backgroundColor: Colors.black12,
                    )),
        ],
      ),
      drawer: DrawerMenuEmail(), // importado
      body: 
      ListView(
        children: [
          Center(
            child: Container(
              child: Column(
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
                          //tela conquistas
                          Navigator.pushNamed(context, '/telainstrucoesemail');
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
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
                              onPressed: () {
                                // buscar video no arquivo api => getBusca
                              },
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
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
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
                  //CARD ESTÀ AQUI
                  Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: BuildListViewEmail(),
                  
                  ),
                  // FeedPage(),
                  //CARD ESTÀ AQUI
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

