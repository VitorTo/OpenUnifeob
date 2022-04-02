import 'package:flutter/material.dart';


class TelaLogin extends StatefulWidget {
 const TelaLogin({Key? key}) : super(key: key);

 @override
 _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
 String _email = "";
 String _senha = "";


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Container(
         padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
            ),
            Text(
              "Open Educação",
              style: TextStyle(fontSize: 30, color: Color(0xff46AEF7)),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
                 decoration:  InputDecoration(
                   labelText: 'Usuário',
                   border: OutlineInputBorder(),
                 ),
               ),
                SizedBox(
                 height: 15.5,
               ),
               TextFormField(
                 decoration:  InputDecoration(
                   labelText: 'Senha',
                   border: OutlineInputBorder(),
                 ),
               ),
                SizedBox(
                 height: 20.0,
               ),
             SizedBox(height: 15.0,),
            SizedBox(
                 width: 360,
                 height: 60,
                 child: ElevatedButton(
                   onPressed: () {
                     Navigator.of(context).pushNamed('/principal');
                   },
                   child: const Text(
                     "Login",
                     style: TextStyle(fontSize: 20),
                   ),
                 ),
               ),
            TextButton(
              onPressed: (){
                      Navigator.of(context).pushNamed('/cadastro');
                    },
                child: Text("Registre-se")
            ),
            // Text(_email),
            // Text(_senha),
          ],
        ),
       ),
     ),
   );
 }
}
