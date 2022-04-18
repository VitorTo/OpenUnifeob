import 'package:flutter/material.dart';

class Expansiontile extends StatelessWidget {
  const Expansiontile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Biografia'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    'data'
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}