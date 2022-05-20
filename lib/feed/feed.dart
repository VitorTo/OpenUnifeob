import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:openeducacao/feed/ifeed.dart';
import 'package:intl/intl.dart';

class Feed implements IFeed {
  final String text;
  final DateTime date;

  Feed({required this.text}) : date = DateTime.now();

  @override
  Widget render() {
    // usar o card foi feito na tela principal
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: renderContent(),
    );
  }

  @override
  Widget renderContent() {
    //conteúdo 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        
        
      ],
    );
  }

  @override
  Widget renderBottom() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Enviando em ${DateFormat('dd/MM/yyyy').format(date)}',
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }
}
