import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Health System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Le(),

    );
  }
}

class Le extends StatefulWidget {
  const Le({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Le> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Location"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.indigo,
        child: Column(

          children: [
            Image.asset('assets/logo.png'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(' Addis Ababa, Ethiopia',style: TextStyle(fontSize: 20),),
            ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Bole Sub-city Wereda 4',style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Tel:  +251 -116180449',style: TextStyle(fontSize: 20)),
        ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Email:  info@addishiwothospital.com',style: TextStyle(fontSize: 20)),
          )
          ],
        ),

    ));
  }
}