import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:openeducacao/feed/feed.dart';
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




  Future<Map> _mostraDados() async { // quem recebe tem que ser Futire
  http.Response response;
    response = await http.get(Uri.parse('https://atividadeopenunifeob.000webhostapp.com/selvideoprint.php'));
    print("--------############################################################--------");
    // print(json.decode(response.body));
  // final data = response as Map;
  //   final forecasts = data["forecasts"];
    Map<dynamic, dynamic> a = json.decode(response.body);
    print(a);

    // print(a.length);
    return a;
    //print(response.body);
    //Map<dynamic, dynamic> a = {"a":1};
    //return(a);
  }

  @override
  void initState() {
    super.initState();
    Future<Map> a = _mostraDados();

    print(a);
    // foreach
    feed.add(FeedYoutube(text: 'Youtube Vídeo', videoId: 'umhl2hakkcY'));
    // foreach

    // feed.add(FeedImage( text: 'Como fazer clone do YOUTUBE', url: 'https://img.youtube.com/vi/Gm8QuYvOTwE/0.jpg'));

  }

  @override
  Widget build(BuildContext context) {
    

    return Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: GestureDetector(
              onTap: () {
                // _mostraDados();
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