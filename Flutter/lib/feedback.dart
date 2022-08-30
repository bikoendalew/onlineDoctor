import 'dart:convert';
import 'package:ee_health/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




void main() {
  runApp(Feedback());
}

class Feedback extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Heatlh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Fk(),
    );
  }
}

class Fk extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Fk> {
  final GlobalKey<FormState>_key=GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  Future feedback() async {

    var url = Uri.parse("http://10.0.2.2/flutter/feedback.php");
    var response = await http.post(url, body: {
      "name": name.text,
      "email": user.text,
      "message": pass.text,
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
    if (response.statusCode == 200) {

      Fluttertoast.showToast(
          msg: ('Send'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      List results;

      var resBody = json.decode(response.body);
      results = resBody;




    }
    else if(response.statusCode==404) {
      Fluttertoast.showToast(
          msg: 'Error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else{

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


          title: Text(
            'Feedback  Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,

          color:Colors.blueGrey,

          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Feedback',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator:(value) {
                      if (value == null || value.isEmpty) return 'Field is Required';
                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'your name',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    validator:(value){
                      if(value==null||value.isEmpty)return 'Field is Required';
                      String pattern=r'\w+@\w+\.\w+';
                      if(!RegExp(pattern).hasMatch(value))
                        return 'Invalid E-mail Address format.';

                      return null;
                    },
                    controller: user,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator:(value) {
                      if (value == null || value.isEmpty) return 'Field is Required';
                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: 'Message',
                      prefixIcon: Icon(Icons.chat),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    controller: pass,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Colors.pink,
                        child: Text('Send',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          if(_key.currentState!.validate()){
                            _key.currentState!.save();
                            feedback();
                          }

                        },
                      ),
                    ),
    ]
    )
              ],
    ),))
    );


  }
}
