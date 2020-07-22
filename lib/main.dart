import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    return diceApp();
    return ballApp();
  }

  //=====begin ball app======
  MaterialApp ballApp() {
    return MaterialApp(
      title: "Ball App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Ask Me Anything"),
          backgroundColor: Colors.blue[900],
        ),
        body: BallPage(),
      ),
    );
  }

  //=====end ball app======

  //=====begin dice app======

  MaterialApp diceApp() {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dicee"),
          backgroundColor: Colors.red,
        ),
//        body: DicePage(),
        body: myCard(),
      ),
    );
  }

//========end dice======

  ///不通过继承StatefulWidget 或 StatelessWidget 来实现页面
  SafeArea myCard() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("images/myicon.jpg"),
          ),
          Text(
            "Javy Liu",
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.teal.shade100,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2.5,
            ),
          ),
          SizedBox(
            height: 20,
            width: 150,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+186 0097 9634',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                )),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.teal,
              ),
              title: Text(
                'javy_liu@163.com',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///ball 组件
class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        child: Image.asset(
          'images/ball$ballNumber.png',
        ),
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
          print('I got clicked, the ball number is: $ballNumber');

        },
      ),
    );
  }
}

///dece页面内容
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNum = 4;
  var rightDiceNum = 6;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: onClicked,
              child: Image.asset(
                "images/dice$leftDiceNum.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitWidth,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: onClicked,
              child: Image.asset(
                "images/dice$rightDiceNum.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitWidth,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClicked() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
      print("left button got pressed.=$leftDiceNum");
    });
  }
}
