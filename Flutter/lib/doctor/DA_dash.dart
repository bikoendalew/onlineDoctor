import  'package:flutter/material.dart';

import '../main.dart';
import 'setApp.dart';

class DHAScreen extends StatefulWidget {
  final List jsondata;
  DHAScreen({Key? key, required this.jsondata}) : super(key: key);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<DHAScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            leading:IconButton(
              onPressed:() {
                Navigator.pop(context);
              },
              icon:Icon(Icons.home),
            ),
            title: Text('Appointment Page'),
            centerTitle: true,
            actions:[

              IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
              },icon:Icon(Icons.logout),)
            ]
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        Text('Appontment ID: '+widget.jsondata[index]['app_id'],style: TextStyle(
                          fontSize: 30,color:Colors.black,
                        ),),
                        SizedBox(height: 20,),

                        Text('Patient Name: '+widget.jsondata[index]['pn'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),

                        Text('Doctor Name: '+widget.jsondata[index]['dn'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),


                        Text('Date :'+widget.jsondata[index]['date'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        SizedBox(height: 20,),
                        Text('Status:'+widget.jsondata[index]['permission'],style: TextStyle(
                          fontSize: 30,color:Colors.black,)),
                        ElevatedButton(
                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Set(list:widget.jsondata,index: index,),),);
                            },
                            child:Text('Set',style:TextStyle(fontSize: 40),),
                        )
                      ],
                    )


                );
              }
          ),
        )
    );
  }
}
