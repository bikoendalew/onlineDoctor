import  'package:flutter/material.dart';
import '../main.dart';
import 'FR.dart';


class DFScreen extends StatefulWidget {

  final List jsondata;
  DFScreen({Key? key, required this.jsondata}) : super(key: key);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<DFScreen> {

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
          title: Text('Appointment'),
          centerTitle: true,

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
                        ElevatedButton(

                            onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>SetFR(list:widget.jsondata,index: index,),),);
                            },
                            child:
                        Text('Replay',style:TextStyle(fontSize: 40)),
                        )

    ]               ));
              }
          ),
        )
    );
  }
}
