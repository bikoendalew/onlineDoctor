
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'setApp.dart';
void run(){
  runApp(MaterialApp(
      home:DApp()
  ));
}
class DApp extends StatefulWidget {


  const DApp({Key? key}) : super(key: key);

  @override
  State<DApp> createState() => _AhistState();
}

class _AhistState extends State<DApp> {
  List PAList=[];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/pH.php");
    var response = await http.get(url);
    setState((){
      PAList=jsonDecode(response.body);
    });

    return PAList;
  }

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Appointment'),),
        body: ListView.builder(
          itemCount: PAList.length,
          itemBuilder:(context,index){
            return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),),
                child:Container(
                  child: Column(

                    children: [
                      Text('APP_id: '+PAList[index]['app_id'],style: TextStyle(fontSize: 20),),
                      Text('Patient\'s ID: '+PAList[index]['P_id'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s ID: '+PAList[index]['D_id'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s Name: ' +PAList[index]['dn'],style: TextStyle(fontSize: 20),),
                      Text('Date: ' +PAList[index]['date'],style: TextStyle(fontSize: 20),),
                      Text('Status: ' +PAList[index]['permission'],style: TextStyle(fontSize: 20),),

                      ElevatedButton(
                          onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>Set(list:PAList,index: index,),),);
                          },
                          child:Text('Set')
                      )
                    ],
                  ),
                )
            );
          },
        )

    );
  }

}
