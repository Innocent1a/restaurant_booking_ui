import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400.0,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  "assets/restaurant.jpg",
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  "Malawi",
                  style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.3),
                      letterSpacing: 10.0),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 15,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.redAccent[700]),
                ),
              ),
              Positioned(
                top: 200,
                left: 40,
                child: Column(
                  children: <Widget>[
                    Text("WELCOME TO",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                  ],
                ),
              ),
              Positioned(
                top: 235,
                left: 40,
                child: Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Amy\'s court',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      Text(
                        ',',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Blantyre',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ]),
              ),
              Positioned(
                  top: 320,
                  left: 25,
                  right: 25,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF262626),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Lets explore',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          contentPadding: EdgeInsets.only(top: 15),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem('Burger', Icons.fastfood),
              _buildMenuItem('tea', Icons.free_breakfast),
              _buildMenuItem('Beer', Icons.local_drink),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem('Cake', Icons.cake),
              _buildMenuItem('Coffee', Icons.coffee),
              _buildMenuItem('Meat', Icons.local_dining),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMenuItem('Ice', Icons.cloud),
              _buildMenuItem('Fish', Icons.restaurant),
              _buildMenuItem('Dounut', Icons.donut_large_outlined),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selectedFood == 'foodName' ? 100 : 75,
        width: selectedFood == 'foodName' ? 100 : 75,
        color: selectedFood == 'foodName' ? Colors.green : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: selectedFood == foodName ? Colors.orange : Colors.grey,
              size: 36,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              foodName,
              style: TextStyle(
                  color: selectedFood == foodName ? Colors.orange : Colors.grey,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  selectedMenuOption(String foodName) {
    setState(() {
      setState(() {
        selectedFood = foodName;
      });
    });
  }
}
