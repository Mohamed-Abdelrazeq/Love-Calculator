import 'package:flutter/material.dart';
import 'package:love_calculator_app/ResultScreen.dart';


class MyHomePage extends StatefulWidget {
  static const String id = '/MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width*.1),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*.2,),
              Text(
                'Love Calculator',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: height*.04,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: height*.01,),
              Text(
                'it\' fun',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: height*.025,
                    fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(height: height*.08,),
              Text(
                'FIRST NAME',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height*.025,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*.01,),
              MyTextField(hint: 'first name',controller: firstName,),
              SizedBox(height: height*.02,),
              Text(
                'SECOND NAME',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height*.025,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: height*.02,),
              MyTextField(hint: 'second name',controller: secondName,),
              SizedBox(height: height*.1,),
              GestureDetector(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen(firstName: firstName.text,secondName: secondName.text,),
                    ),
                  );
                  FocusScope.of(context).requestFocus(FocusNode());
                  firstName.clear();
                  secondName.clear();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width*.1),
                  width: width*.6,
                  height: height*.08,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(height*.015)
                  ),
                  child: Center(
                    child: Text(
                      'Check it',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: height*.026
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {

  MyTextField({@required this.hint,@required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
          hintText: hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}