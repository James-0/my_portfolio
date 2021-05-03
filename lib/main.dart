// Flutter 1.1: Portfolio App
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular'),
  ));
}

class HomePage extends StatelessWidget {
  final String text01 = 'User Experience';
  final String text11 = 'Other Skills';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned.fill(
                  left: 20,
                  top: 20,
                  child: Container(
                    child: Text(
                      'My Portfolio',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )),
              Positioned.fill(
                  right: -600,
                  bottom: -900,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue[400]),
                  )),
              Positioned.fill(
                  left: -500,
                  bottom: -1200,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  )),
              Positioned.fill(
                left: 1,
                top: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FirstPage(),
                      SecondPage(text01, () => Cont1(), Colors.orange),
                      SecondPage(text11, () => ListCLass(), Colors.blue)
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                  left: 180,
                  top: 680,
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(child: Text('swipe')),
                          Row(children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            Icon(Icons.arrow_forward, color: Colors.black)
                          ]),
                        ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 100.0, 0, 10),
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Ude James',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Hello, my\nname is James\nI\'m a Mobile \nDeveloper.',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Icon(Icons.web), Text('GitHub')],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.youtube_searched_for_sharp),
                    Text('Google')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String text1;
  final Widget Function() myClass;
  final Color color;
  SecondPage([this.text1, this.myClass, this.color]);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 600,
      width: 360,
      // width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: 200,
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: customShadow,
                color: primaryColor),
            child: Center(
              child: Container(
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: color, width: 2.0, style: BorderStyle.solid),
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/james.jpg'))),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Expanded(child: myClass())
              ],
            ),
          ),
          Container(
            height: 50,
            width: 300,
            child: OutlinedButton(
              onPressed: () {
                print('pressed');
              },
              child: Text(
                'find out more',
              ),
              style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueGrey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          )
        ],
      ),
    );
  }
}

class Cont1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(40),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'I am warmed of mobile technologies. '
        'A Computer and technology enthusiast with '
        'skillsets in html, css, java, kotlin and flutter '
        'programming languages',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}

class ListCLass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: skills
              .map((e) => Row(
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: pieColors[skills.indexOf(e)],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(e['name'])
                    ],
                  ))
              .toList()),
    );
  }
}

List skills = [
  {"name": "photoshop"},
  {"name": "drumming"},
  {"name": "writing"},
];

List pieColors = [Colors.blue, Colors.indigo, Colors.red];

Color primaryColor = Color(0xFFCDADCED);

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: 5,
      offset: Offset(0, 3),
      blurRadius: 7),
];
