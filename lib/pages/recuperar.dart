import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaRecuperacaoSenha extends StatefulWidget {
  const TelaRecuperacaoSenha({Key? key}) : super(key: key);

  @override
  State<TelaRecuperacaoSenha> createState() => _TelaRecuperacaoSenhaState();
}

class _TelaRecuperacaoSenhaState extends State<TelaRecuperacaoSenha> {
  String _email = "";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Recuperação de Senha",
                           style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),
                      Text("Open Educação", style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff46AEF7),
                              ),)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Digite o seu e-mail',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(
                      60), // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                child: const Text('Recuperar', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row (children: <Widget>[
                        Icon(Icons.arrow_back),
                      const Text("Voltar", style: TextStyle(fontSize: 16),),

                      ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}