import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'FHP_dash.dart';
import 'PH_dash.dart';


class AHP extends StatefulWidget {
  final List list;
  final int index;
  AHP({required this.list, required this.index});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<AHP> {
  bool editMode = false;

  Future GAHP() async {
    var url = Uri.parse("http://10.0.2.2/flutter/PA.php");
    var response = await http.post(url, body: {
      'P_id': widget.list[widget.index]['P_id'],
    });

    if (response.statusCode == 200) {
      List results;
      var resBody = json.decode(response.body);
      results = resBody;

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PHAScreen(jsondata: results),
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
    var url = Uri.parse("http://10.0.2.2/flutter/PF.php");
    var response = await http.post(url, body: {
      'P_id':widget.list[widget.index]['P_id'],
    });
    if (response.statusCode == 200) {
      List results;

      var resBody = json.decode(response.body);
      results = resBody;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>PHFScreen(jsondata: results),
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
      appBar: AppBar(
        leading:IconButton(
          onPressed:() {
            Navigator.pop(context);
          },
          icon:Icon(Icons.home),
        ),
        title: Text('Previous Page'),centerTitle: true,),
      body:Container(
        color:Colors.blueGrey,
        child:Center(
            child:Column( children:[
            MaterialButton(
              color:Colors.green,
                child: Text('Appointment',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                onPressed: () {
                  GAHP();
                },
              ), MaterialButton(onPressed: (){
                GFHP();
              },
                  color:Colors.green,
                  child: Text('Followup',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
            ])
        ),
      ),
    );
  }
}
