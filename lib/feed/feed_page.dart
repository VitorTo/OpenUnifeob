import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:openeducacao/feed/feed.dart';
import 'package:openeducacao/feed/feed_image.dart';
// import 'package:openeducacao/feed/feed_image.dart';
import 'package:openeducacao/feed/feed_youtube.dart';
import 'package:openeducacao/feed/ifeed.dart';
import 'package:http/http.dart' as http;

// import 'feed/feed_propaganda.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<IFeed> feed = [];

    String _search = '';
  int _offset = 0;

  Future<Map> _getSearch() async { // quem recebe tem que ser Futire
    http.Response response;

    if (_search == null) {
      response = await http.get(Uri.parse('https://atividadeopenunifeob.000webhostapp.com/selvideo.php'));
      print(response.body);
    } else {
      response = await http.get(Uri.parse(
          'https://api.giphy.com/v1/gifs/search?api_key=iZ2YRjDG89SIZO8MN6k99BPwHNGlr54s&q=$_search&limit=19&offset=$_offset&rating=g&lang=en'));
    }
    Map resultado = json.decode(response.body);
    print(resultado[0]["titulo"]);
    
    return resultado;
  }

  recebeDados(){
    String text = '';
    String url = '';

  }

  @override
  void initState() {
    super.initState();
    feed.add(FeedYoutube(text: 'Youtube Vídeo', videoId: 'umhl2hakkcY'));

    feed.add(FeedImage( text: 'Como fazer clone do YOUTUBE', url: 'https://img.youtube.com/vi/umhl2hakkcY/0.jpg'));

    feed.add(FeedImage( text: 'Como fazer clone do YOUTUBE', url: 'https://img.youtube.com/vi/Gm8QuYvOTwE/0.jpg'));

    feed.add(FeedImage( text: 'Como fazer clone do YOUTUBE', url: 'https://img.youtube.com/vi/Gm8QuYvOTwE/0.jpg'));


  }

  mostrarDetalhes(){

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: GestureDetector(
              onTap: () {
                
                mostrarDetalhes();
                // Navigator.of(context).pushNamed('/detalhesvideo');

              },
              child: ListView.builder(
                physics: ClampingScrollPhysics(), 
                        shrinkWrap: true,
                itemCount: feed.length,
                itemBuilder: (context, index) => feed[index].render(),
              ),
        ),
      
      
    );
  }
}





// GridView.builder(
//       primary: false,
//       padding: const EdgeInsets.all(20),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: feed.length),
//       itemCount: feed.length,
//       itemBuilder: (context, index) => feed[index].render(),
//       // itemCount: feed.length,
//       )



    // GridView.count(
    //     primary: false,
    //     padding: const EdgeInsets.all(20),
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     crossAxisCount: 2,
    //     // itemCount: feed.length,
    //     children: <Widget>[
    //        Builder(builder: (BuildContext context) =>  feed[index].render(),),
          
    //     ]);
  // ListView.builder(
  //     itemCount: feed.length,
  //     itemBuilder: (context, index) => feed[index].render(),
  // );
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     body: ListView.builder(
  //       itemCount: feed.length,
  //       itemBuilder: (context, index) => feed[index].render(),
  //     ),
  //   );
  // 