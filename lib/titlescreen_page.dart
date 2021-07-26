import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_calculator_practice/about_page.dart';
import 'package:flutter_calculator_practice/calculator_page.dart';

class TitleScreenPage extends StatelessWidget {
  Container imageBox(String imgsrc) {
    return Container(
        width: 120.0,
        height: 120.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new AssetImage(imgsrc))));
  }

  ConstrainedBox buildButtonNext(
      BuildContext context, String label, MaterialPageRoute target) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {
          Navigator.push(
            context,
            target,
          );
        },
      ),
    );
  }

  Widget buildBodyContent(BuildContext context){
    return Stack(children: [
      Positioned.fill(
        //
        child: Image(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageBox("assets/flutter_logo.png"),
          Divider(
            height: 20.0,
          ),
          Text("Flutter Calculator Practice",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          Divider(
            height: 30.0,
          ),
          buildButtonNext(
              context,
              "Open Calculator",
              MaterialPageRoute(
                  builder: (context) =>
                      CalculatorPage(title: "Calculator Page"))),
          buildButtonNext(context, "About",
              MaterialPageRoute(builder: (context) => AboutPage())),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: buildBodyContent(context),
      ),
    );
  }
}
