
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void run(){
  runApp(MaterialApp(
      home:AD()
  ));
}
class AD extends StatefulWidget {
  const AD({Key? key}) : super(key: key);

  @override
  State<AD> createState() => _AhistState();
}

class _AhistState extends State<AD> {
  List PList=[];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/AllApp.php");
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
        appBar: AppBar(title: Text('Patient Appointment Histroy'),),
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
                      Text('APP_id: '+PList[index]['app_id'],style: TextStyle(fontSize: 20),),
                      Text('Patient\'s ID: '+PList[index]['P_id'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s ID: '+PList[index]['D_id'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s Name: ' +PList[index]['dn'],style: TextStyle(fontSize: 20),),
                      Text('Date: ' +PList[index]['date'],style: TextStyle(fontSize: 20),),
                      Text('Status: ' +PList[index]['permission'],style: TextStyle(fontSize: 20),),
                    ],
                  ),
                )
            );
          },
        )

    );
  }

}
