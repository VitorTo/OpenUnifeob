import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:openeducacao/parts/drawer_menu.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userGoogle = FirebaseAuth.instance.currentUser!;
    final nomeUser = userGoogle.displayName!.split(" ");

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
            child: userGoogle == null
                ? Text(
                    'seu nome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    nomeUser[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                backgroundImage: NetworkImage(userGoogle == null
                    ? "https://cdn-icons-png.flaticon.com/512/149/149071.png"
                    : userGoogle.photoURL!),
                backgroundColor: Colors.white,
              )),
        ],
      ),
      drawer: DrawerMenu(),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Padding(
              padding: EdgeInsets.fromLTRB( 0, 20, 0, 0), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    width: 150.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userGoogle == null
                              ? "https://cdn-icons-png.flaticon.com/512/149/149071.png"
                              : userGoogle.photoURL!),
                          backgroundColor: Colors.white,
                        )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userGoogle == null
                          ? Text(
                              'Nome Indefinido',
                              style:
                                  TextStyle(fontSize: 20, ),
                            )
                          : Text(
                              nomeUser[0] + ' ' + nomeUser[1],
                              style:
                                  TextStyle(fontSize: 20, ),
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                     
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 25,
                          color: Colors.grey,
                         
                        ),
                      ),
                    ],
                  ),
                  Row(    
                    mainAxisAlignment: MainAxisAlignment.center,                
                    children: <Widget>[
                          SizedBox(width: 20,),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () { },
                              icon: Text("Biografia",
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              label: Icon(
                                Icons.keyboard_arrow_down,
                                size: 35,
                              ),
                            ),
                          ),
                        SizedBox(width: 20,),
                      
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   Text('body')
                      Text(
                        'Conquistas',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                           ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                          child: Text(
                            "Explorador",
                            style: TextStyle(
                              fontSize: 18.0,
                              
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/explorador.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                          child: Text(
                            "Aventureiro",
                            style: TextStyle(
                              fontSize: 18.0,
                             
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/aventureiro.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        icon: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Text(
                            "Desbravador",
                            style: TextStyle(
                              fontSize: 18.0,
                             
                            ),
                          ),
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/desbravador.png",
                            width: 70.0,
                            height: 55.0,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
              
            ),
          ),
        ],
      ),
    );
  }
}
