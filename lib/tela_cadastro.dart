// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
 const TelaCadastro({Key? key}) : super(key: key);

 @override
 _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Container(
         padding: const EdgeInsets.symmetric(
           horizontal: 25.0,
           //vertical: 10.0
         ),
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(
                 "Login",
               ),
               Text(
                 "Open Educação",
                 style: TextStyle(fontSize: 36, color: Color(0xff46AEF7)),
               ),
               SizedBox(
                 height: 15.0,
               ),
               TextFormField(
                 decoration: const InputDecoration(
                   labelText: 'Nome Completo',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(
                 height: 15.5,
               ),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'E-mail',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(
                 height: 15.5,
               ),
               TextFormField(
                 decoration: const InputDecoration(
                   labelText: 'Usuário',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(
                 height: 15.5,
               ),
               TextFormField(
                 decoration: const InputDecoration(
                   labelText: 'Senha',
                   border: OutlineInputBorder(),
                 ),
               ),
               const SizedBox(
                 height: 20.0,
               ),
               SizedBox(
                 width: 360,
                 height: 60,
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.of(context).pushNamed('/principal');
                   },
                   child: const Text(
                     "Registrar",
                     style: TextStyle(fontSize: 20),
                   ),
                 ),
               ),
             ]),
       ),
     ),
   );
 }
}
