import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          child: FutureBuilder<String>(
        future: createFutureMethodOne(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Future completed with an error.
            return Text(
              'On error : ${snapshot.error}',
            );
          } else if (snapshot.hasData) {
            // Future completed with a value.
            return Text(
              'On success : ${snapshot.data}',
            );
          } else {
            // Uncompleted.
            return Text(
              'Waiting',
            );
          }
        },
      )),
    );
  }

  Future<String> createFutureMethodOne() {
    Future<String> future = Future(() {
      Random rng = Random();
      if (rng.nextBool()) {
        return 'Sucess';
      } else {
        throw ("There is some error");
      }
    });
    return future;
  }
}
