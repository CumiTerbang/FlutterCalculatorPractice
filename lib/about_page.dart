import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Column(
            children: [
              Text("Flutter Calculator Page",
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              Divider(height: 20),
              Text(
                  "Welcome to my simple flutter project.\nIn this project I try to create simple mobile apps for practice flutter",
                  style:
                      TextStyle(fontSize: 14.0)),
            ],
          )),
    );
  }
}
