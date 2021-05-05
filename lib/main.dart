// Flutter 1.1: Portfolio App
// Feature: Swiping to reveal other competencies
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: HeaderClass(),
          ),
          Expanded(
            child: Container(
              height: 700,
              width: MediaQuery.of(context).size.width,
              child: BodyClass(),
            ),
          ),
        ]),
      ),
    );
  }
}

class HeaderClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        'My Portfolio',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      CircleAvatar(
        radius: 25,
        backgroundColor: Colors.teal,
        child: CircleAvatar(
            radius: 24, backgroundImage: AssetImage('images/james.jpg')),
      ),
    ]);
  }
}

class BodyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            )),
        Positioned.fill(
          left: -20,
          top: -30,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FirstPage(),
                SecondPage(() => Cont1(), Colors.orange, 'bio.png'),
                SecondPage(() => ListCLass(), Colors.blue, 'skill.png')
              ],
            ),
          ),
        ),
        Positioned.fill(
            left: MediaQuery.of(context).size.width * 0.45,
            top: 630,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            'swipe',
                            style: TextStyle(color: Colors.white),
                          )),
                      Row(children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Icon(Icons.arrow_forward, color: Colors.white)
                      ]),
                    ]),
              ),
            )),
      ],
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Container(
                  height: 2.0,
                  width: 50.0,
                  color: Colors.blueAccent[700],
                ),
              ),
              Text(
                'Ude James',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent[700],
                ),
              ),
            ]),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text('agbai616@gmail.com')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text('08184492914')
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Icon(
                        Icons.work_rounded,
                        size: 15,
                      ),
                      SizedBox(width: 10),
                      Text('github.com/James-0')
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String pic;
  final Widget Function() myClass;
  final Color color;
  SecondPage([this.myClass, this.color, this.pic]);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 600,
      width: 360,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: customShadow,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: color,
              child: CircleAvatar(
                  radius: 72, backgroundImage: AssetImage('images/$pic')),
            ),
          ),
          Expanded(child: myClass()),
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
                  backgroundColor: Colors.blue[900],
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text('Bio/User Experience',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Container(
            // padding: EdgeInsets.all(40),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              'I am warmed of mobile technologies. '
              'A Computer and technology enthusiast with '
              'skill sets in html, css, java, kotlin and flutter '
              'programming languages',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ]);
  }
}

class ListCLass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text('Other Skills',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
          ),
        ),
      ],
    );
  }
}

List skills = [
  {"name": "problem solving"},
  {"name": "critical thinking"},
  {"name": "communication"},
  {"name": "teamwork"},
  {"name": "creativity"},
  {"name": "attention to detail"},
  {"name": "organization"}
];

List pieColors = [
  Colors.blue,
  Colors.indigo,
  Colors.red,
  Colors.orangeAccent,
  Colors.blueAccent,
  Colors.cyan,
  Colors.brown
];

Color primaryColor = Color(0xFFCDADCED);

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.blue.withOpacity(0.5),
      spreadRadius: 5,
      offset: Offset(0, 3),
      blurRadius: 7),
];
