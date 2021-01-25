import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:love_calculator_app/MyHomePage.dart';

class IntroScreen extends StatefulWidget {
  static const String id = '/IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double pageNumber = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        onPageChanged: (num) {
          print(num);
          setState(() {
            pageNumber = num.toDouble();
          });
        },
        children: [
          IntroScreenItem(
            height: height,
            width: width,
            imagePath: 'images/Asset 1.png',
            mainText: 'Have A Lover',
            secText: 'And you know if you could be \ntogether ?',
            buttonText: 'Next',
            currentPage: pageNumber.toDouble(),
            myFunction: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              print(_controller.page);
            },
          ),
          IntroScreenItem(
            height: height,
            width: width,
            imagePath: 'images/Asset 2.png',
            mainText: 'A Girlfriend',
            secText: 'And want to take the relation to the \nnext level',
            buttonText: 'Next',
            currentPage: pageNumber.toDouble(),
            myFunction: () {
              _controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
              print(_controller.page);
            },
          ),
          IntroScreenItem(
            height: height,
            width: width,
            imagePath: 'images/Asset 3.png',
            mainText: 'Dating Someone ?',
            secText: 'but you don\'t know if he is the one \nfor you',
            buttonText: 'Skip',
            currentPage: pageNumber.toDouble(),
            myFunction: () {
              Navigator.pushNamed(context, MyHomePage.id);
            },
          ),
        ],
      ),
    );
  }
}

class IntroScreenItem extends StatelessWidget {
  const IntroScreenItem({
    @required this.currentPage,
    @required this.height,
    @required this.width,
    @required this.imagePath,
    @required this.mainText,
    @required this.secText,
    @required this.buttonText,
    @required this.myFunction,
  });

  final double currentPage;
  final double height;
  final double width;
  final String imagePath;
  final String mainText;
  final String secText;
  final String buttonText;
  final Function myFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: height * .16,
            child: Container(
              height: height * .28,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.contain),
              ),
            ),
          ),
          Positioned(
            top: height * .56,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  child: Text(
                    mainText,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: height * .038,
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .1, vertical: height * .02),
                  child: Text(
                    secText,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: height * .022,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * .74,
            child: Container(
              width: width,
              child: DotsIndicator(
                dotsCount: 3,
                position: currentPage,
                decorator: DotsDecorator(
                  activeColor: Colors.red,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * .85,
            left: width * .15,
            child: GestureDetector(
              onTap: myFunction,
              child: Container(
                height: height * .07,
                width: width * .7,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(150)),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height * .024,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
