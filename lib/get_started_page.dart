import 'package:flutter/material.dart';
import 'package:smart_b/home_page.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              //margin:EdgeInsets.only(bottom: 200.0) ,
              child: Image.asset(
            "images/logo.png",
            height: 170,
            width: 170,
          )),
          SizedBox(
            height: 60.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your User ID",
                  labelStyle: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 61,
            width: 218,
            decoration: BoxDecoration(
                color: Color(0xFF44CBB1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const homePage()),
                  );
                });
              },
              child: Text('Get started',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ],
      )),
    );
  }
}
