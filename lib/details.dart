import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String url;

  DetailPage(this.url);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Chip(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.fromLTRB(25, 12, 25, 12),
          label: Text("book now",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.url,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 15.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.4),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ),
          buildAvatar(105.0,
              "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(85.0,
              "https://images.pexels.com/photos/532220/pexels-photo-532220.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(65.0,
              "https://images.pexels.com/photos/1984117/pexels-photo-1984117.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          buildAvatar(45.0,
              "https://images.pexels.com/photos/1065084/pexels-photo-1065084.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.40,
            left: 25.0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(width: 1.0, color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              alignment: Alignment.center,
              child: Text(
                "4.5",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 25.0,
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.2))
                    ]),
                    child: Text(
                      "176 reviews, 10 Friends",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Amy's Burger",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildItemRow(
                        "https://i.ndtvimg.com/i/2016-05/chilli-burger_625x350_41464592906.jpg",
                        "Chilli With Pepper Relish",
                        "under a chilli lamb pattie, roasted bell pepper dip, onions, tomatoes and lettuce.",
                        "MK7,000"),
                    buildItemRow(
                        "https://i.ndtvimg.com/i/2016-05/lentil-mushroom-burger_625x350_71464592318.jpg",
                        "Lentil and Mushroom",
                        "For the healthy and calorie conscious folks we've got this tasty burger           .",
                        "MK9,000"),
                    buildItemRow(
                        "https://i.ndtvimg.com/i/2016-05/chicken-fish-burger_625x350_61464592753.jpg",
                        "Crunchy Chicken and Fish",
                        "If a burger for you is all about the meat and protein then you're at the right place.",
                        "MK4,000"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildItemRow(
      String url, String title, String caption, String price) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(url),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    caption,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned buildAvatar(double leftPosition, String url) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.40,
      left: leftPosition,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(width: 1.0, color: Colors.white),
        ),
      ),
    );
  }
}
