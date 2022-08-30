import  'package:flutter/material.dart';

import '../main.dart';


class PHFScreen extends StatefulWidget {

  final List jsondata;
  PHFScreen({Key? key, required this.jsondata}) : super(key: key);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<PHFScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('FollowUP  History'),
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon:Icon(Icons.home)),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blueGrey,

          child: ListView.builder(
              itemCount: widget.jsondata == null ? 0 : widget.jsondata.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    elevation: 5,
                    color:Colors.indigo,
                    child:Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Text('FollowUp ID: '+widget.jsondata[index]['f_id'],style: TextStyle(
                          fontSize: 30,color:Colors.black,
                        ),),
                        SizedBox(height: 20,),

                        Text('Doctor ID: '+widget.jsondata[index]['D_id'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),

                        Text('Patient case: '+widget.jsondata[index]['P_case'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),


                        Text('Answere :'+widget.jsondata[index]['D_ans'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),


                        SizedBox(height: 50,),

                      ],
                    ));
              }
          ),
        )
    );
  }
}
