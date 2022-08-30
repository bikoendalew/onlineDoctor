import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'DA_dash.dart';
import 'DF_dash.dart';



class DR extends StatefulWidget {
  final List list;
  final int index;
  DR ({required this.list, required this.index});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<DR> {
  bool editMode = false;

  Future GAHP() async {
    var url = Uri.parse("http://10.0.2.2/flutter/AD.php");
    var response = await http.post(url, body: {
      'D_id': widget.list[widget.index]['D_id'],
    });

    if (response.statusCode == 200) {
      List results;
      var resBody = json.decode(response.body);
      results = resBody;

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DHAScreen(jsondata: results),
          )
      );
    }
    else if(response.statusCode==404){
      Fluttertoast.showToast(
          msg: 'No Data',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    else{
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp()),
      );

    }
  }
  Future GFHP() async {
    var url = Uri.parse("http://10.0.2.2/flutter/FD.php");
    var response = await http.post(url, body: {
      'D_id':widget.list[widget.index]['D_id'],
    });
    if (response.statusCode == 200) {
      List results;

      var resBody = json.decode(response.body);
      results = resBody;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>DFScreen(jsondata: results),
          ));

    }
    else if(response.statusCode==404){

      Fluttertoast.showToast(
          msg: 'No Data',
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
      appBar: AppBar(title: Text('Response Page'),centerTitle: true,),
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/bg.jpg'),fit:BoxFit.fill,
          )
        ),
      //  color:Colors.blueGrey,
        child:Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

              MaterialButton(
                color:Colors.black87,
                child: Text('Appointment',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  GAHP();
                },
              ),
              MaterialButton(onPressed: (){

                GFHP();
              }, color:Colors.black87,
                  child: Text('FollowUp',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
            )
            ]
            )
        ),
      ),
    );
  }
}
