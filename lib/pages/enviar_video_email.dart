
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:openeducacao/parts/drawer_menu_email.dart';

class EnviarVideoEmail extends StatefulWidget {
  const EnviarVideoEmail({Key? key}) : super(key: key);

  @override
  _EnviarVideoEmailState createState() => _EnviarVideoEmailState();
}

class _EnviarVideoEmailState extends State<EnviarVideoEmail> {
  final formKey = GlobalKey<FormState>();
  final titulo = TextEditingController();
  final descricao = TextEditingController();
  final link = TextEditingController();

  bool isVideo = true;
  late String actionButton;
  bool loading = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    setFormAction(true);
  }

  insertVideo(titulo, descricao, link) async {
    // EXEMPLO: index.php?pnome=vitor&email=vitorteste@gmail.com&senha=122342
    var url =
        Uri.parse("https://atividadeopenunifeob.000webhostapp.com/invideo.php");
    await http.post(url,
        body: {'titulo': titulo, 'descricao': descricao, 'url': link});
    //JOGAR ESSAS VARIAVEIS PARA TELA PRINCIPAL
  }

  setFormAction(bool acao) {
    setState(() {
      isVideo = acao;
    });
  }

  video() async {
    if (formKey.currentState!.validate()) {
      setState(() => loading = true);
      try {
        insertVideo(titulo.text, descricao.text, link.text);

        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Seu Video foi enviado para aprovação com sucesso!')),
        );
      } catch (e) {
        setState(() => loading = false);
      }
    }
  }

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
                  "https://freesvg.org/img/abstract-user-flat-3.png"),
              backgroundColor: Colors.black12,
            ),
          ),
        ],
      ),
      drawer: DrawerMenuEmail(),
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
                    height: 10,
                  ),
                  Column(
                    children: [
                      // Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
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
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: titulo,
                                decoration: const InputDecoration(
                                  labelText: 'Titulo',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe o titulo do seu vídeo!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.5,
                              ),
                              TextFormField(
                                controller: descricao,
                                decoration: const InputDecoration(
                                  labelText: 'Descrição',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a descrição do seu vídeo!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.5,
                              ),
                              TextFormField(
                                controller: link,
                                decoration: const InputDecoration(
                                  labelText: 'URL do Vídeo do YouTube',
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.url,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe o link do seu vídeo!';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 15.5,
                              ),
                              SizedBox(
                                width: 360,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isVideo) {
                                      video();
                                    }
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
