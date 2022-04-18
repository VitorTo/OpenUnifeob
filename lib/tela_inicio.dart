import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:openeducacao/provider/google_sign_in.dart';
import 'package:openeducacao/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              //imagem
              SizedBox(
                height: 70,
              ),
              Container(
                width: 330,
                height: 360,
                child: Image.asset('assets/images/inicial.png'),
              ),
              // text title
              Text(
                'Open Educação',
                style: TextStyle(
                    color: Color(0xff46AEF7),
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              // text subtitle
              Text(
                'Faça seu login',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              // button login google
              SizedBox(
                width: 360,
                height: 60,
                child: OutlineButton(
                  splashColor: Color(0xff46AEF7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.google),
                        SizedBox(width: 15,),
                        Text(
                          'Login com Google',
                          style:
                              TextStyle(color: Color(0xff46AEF7), fontSize: 18),
                        ),
                      ]),
                  borderSide: BorderSide(
                    color: Color(0xff46AEF7),
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20,),
              // button login email
              SizedBox(
                width: 360,
                height: 60,
                child: OutlineButton(
                  splashColor: Color(0xff46AEF7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.envelope),
                        SizedBox(width: 15,),
                      Text('Login com Gmail',
                    style: TextStyle(color: Color(0xff46AEF7), fontSize: 18),
                  ),
                    ]
                  ),
                  borderSide: BorderSide(
                    color: Color(0xff46AEF7),
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
