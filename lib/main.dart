import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text("Dicee"),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ));
  }

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
              onPressed: () {
                setState(() {
                  leftDiceNum = 5;
                  print("left button got pressed.=$leftDiceNum");
                });
              },
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
              onPressed: () {
                print("right button get pressed");
              },
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
}
