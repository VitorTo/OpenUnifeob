
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MeuMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userGoogle = FirebaseAuth.instance.currentUser!;

    return AppBar(
      toolbarHeight: 70,
      title: Text(
        "OpenEducação",
        style: TextStyle(
          color: Color(0xff46AEF7),
        ),
        textAlign: TextAlign.start,
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
                  userGoogle.displayName!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/enviarvideo');
            },
            icon: userGoogle == null
                ? CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                    backgroundColor: Colors.black12,
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(userGoogle.photoURL!),
                    backgroundColor: Colors.black12,
                  )),
      ],
    );
  }
}
