
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void run(){
  runApp(MaterialApp(
      home:FReport()
  ));
}
class FReport extends StatefulWidget {
  const FReport({Key? key}) : super(key: key);

  @override
  State<FReport> createState() => _AhistState();
}

class _AhistState extends State<FReport>{
  List PList=[];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/feedbackR.php");
    var response = await http.get(url);
    if(response.statusCode==200){
      setState((){
        PList=jsonDecode(response.body);
      });

      return PList;}
    else if(response.statusCode==404){
      Fluttertoast.showToast(
          msg: ('No Data'),
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
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Feedback Report'),),
        body: ListView.builder(
          itemCount: PList.length,
          itemBuilder:(context,index){
            return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),),
                child:Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('Name: '+PList[index]['name'],style: TextStyle(fontSize: 30),),
                      Text('Email: '+PList[index]['email'],style: TextStyle(fontSize: 30),),
                      Text('Message: '+PList[index]['message'],style: TextStyle(fontSize: 30),),


                    ],
                  ),
                )
            );
          },
        )

    );
  }

}
