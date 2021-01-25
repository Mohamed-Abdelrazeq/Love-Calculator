import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';

class ResultScreen extends StatefulWidget {
  static const String id = '/ResultScreen';

  ResultScreen({@required this.firstName,this.secondName});

  final String firstName;
  final String secondName;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  Future getData(String firstName, String secondName) async {
    var url =
        'https://love-calculator.p.rapidapi.com/getPercentage?fname=$firstName&sname=$secondName';
    var body = {
      "x-rapidapi-key": "36a2e26b45msh809325bed92fff7p10a609jsn8d0d53f73ab5",
      "x-rapidapi-hos": "love-calculator.p.rapidapi.com"
    };

    http.Response response = await http.get(url, headers: body);

    return response.body;
  }

  var spanner = SpinKitRotatingCircle(
    color: Colors.red,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: getData(widget.firstName, widget.secondName),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        Widget myReturn;
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data);
          print(data);
          myReturn = Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(
                  height: height * .2,
                ),
                Container(
                  width: width,
                  height: height * .25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/Asset 2.png'))),
                ),
                SizedBox(
                  height: height * .1,
                ),
                Text(
                  data['percentage'],
                  style: TextStyle(
                      fontSize: height * .05,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Text(
                  data['result'],
                  style: TextStyle(
                      fontSize: height * .03,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: height * .15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * .1),
                    width: width * .6,
                    height: height * .08,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(height * .015)),
                    child: Center(
                      child: Text(
                        'Check it',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: height * .026),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        else if (snapshot.hasError) {
          myReturn = Center(child: Text(snapshot.data.toString()));
        }
        else {
          myReturn = Scaffold(
            body: spanner,
          );
        }
        return myReturn;
      },
    );
  }
}
