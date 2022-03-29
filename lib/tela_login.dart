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
             TextField(
               onChanged: (value){
                 setState(() {
                   _email = value;
                 });
               },
               decoration: InputDecoration(
                 //hintText: "E-mail",
                 labelText: "E-mail"
               ),
             ),
             SizedBox(height: 15.0,),
             TextFormField(
               onChanged: (value){
                 setState(() {
                   _senha = value;
                 });
               },
               obscureText: true,
               decoration: InputDecoration(
                 //hintText: "E-mail",
                   labelText: "Password"
               ),
             ),
             SizedBox(height: 15.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 ElevatedButton(
                     onPressed: (){
                       Navigator.of(context).pushReplacementNamed('/principal');
                     },
                     child: Text('Login')
                 ),
                 SizedBox(width: 5.00,),
                 ElevatedButton(
                     onPressed: (){
                       Navigator.of(context).pushNamed('/cadastro');
                     },
                     child: Text("Cadastre-se")
                 ),

               ],
             ),
             SizedBox(height: 5,),
             TextButton(
                 onPressed: (){},
                 child: Text("Recuperar senha")
             ),
             Text(_email),
             Text(_senha),
           ],
         ),
        ),
      ),
    );
  }
}
