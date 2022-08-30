
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void run(){
  runApp(MaterialApp(
      home:AF()
  ));
}
class AF extends StatefulWidget {
  const AF({Key? key}) : super(key: key);

  @override
  State<AF> createState() => _AhistState();
}

class _AhistState extends State<AF> {
  List PList=[];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/AllFollow.php");
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
        appBar: AppBar(title: Text('Patient FollowUp Histroy'),),
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
                      Text('FollowUp_id: '+PList[index]['f_id'],style: TextStyle(fontSize: 20),),
                      Text('Patient\'s ID: '+PList[index]['P_id'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s ID: '+PList[index]['D_id'],style: TextStyle(fontSize: 20),),
                      Text('Patient\'s Question: ' +PList[index]['P_case'],style: TextStyle(fontSize: 20),),
                      Text('Doctor\'s Answere: ' +PList[index]['D_ans'],style: TextStyle(fontSize: 20),),

                    ],
                  ),
                )
            );
          },
        )

    );
  }

}
