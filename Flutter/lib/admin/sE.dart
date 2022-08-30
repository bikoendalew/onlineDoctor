
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'admin.dart';




class SetD extends StatefulWidget {
  final List list;
  final int index;
  SetD({required this.list, required this.index});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SetD> {
  bool editMode=false;

  Future delete() async {

    var url = Uri.parse("http://10.0.2.2/flutter/del.php");
    var response = await http.post(url, body: {
      'D_id':widget.list[widget.index]['D_id'],
    });

    if(response.statusCode==200){
      Fluttertoast.showToast(
          msg: "Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context,MaterialPageRoute(builder: (Context)=>AdminD()));
    }
    else if(response.statusCode==404){
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  @override
  void initState(){

    editMode=true;

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width:double.infinity,
        height: double.infinity,
        color:Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                       MaterialButton(
                      color: Colors.pink,
                      child: Text('Delete',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        delete();
                      },
                    ),


                ],
              ),
      ),



    );
  }
}