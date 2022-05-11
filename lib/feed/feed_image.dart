// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:openeducacao/feed/feed.dart';
// import 'package:provider/provider.dart';

class FeedImage extends Feed {
  final String text;
  final String url;

  FeedImage({required this.text, required this.url}) : super(text: text);

  @override
  Widget renderContent() {
    return
        //TESTANDO
      Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
          super.renderContent(),
          
        ],
      ),
      
    );
  }
}

//CARD TESTE 1 

// GestureDetector(
        //     onTap: () {
        //       // Navigator.of(context).pushNamed('/detalhesvideo');
        //     },
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: <Widget>[
        //         Container(
        //           width: double.infinity,
        //           height: 300,
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: NetworkImage(url),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         ),
        //         super.renderContent(),
        //       ],
        //     ));

//CARD TESTE 2

// Padding(
        //                 padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        //                 child: GestureDetector(
        //                   onTap: (){
        //                      Navigator.of(context).pushNamed('/detalhesvideo');
        //                   },
        //                   child:
        //                 Card(
        //                   clipBehavior: Clip.antiAlias,
        //                   child: Column(
        //                     children: [
        //                       Image.network(url),
        //                       // Image.asset(
        //                       //   'assets/images/figma.png',

        //                       // ),
        //                       ListTile(
        //                         title: Text(
        //                           text,
        //                         ),
        //                         subtitle: Text(
        //                           'Figma é um editor gráfico de vetor e prototipagem de projetos de design baseado principalmente no navegador web...',
        //                           style: TextStyle(
        //                               color: Colors.black.withOpacity(0.6)),
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         height: 10,
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 ),
        //               );