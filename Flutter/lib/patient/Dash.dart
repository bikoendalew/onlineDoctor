
import 'package:ee_health/patient/DoctorList.dart';
import 'package:ee_health/patient/updateP.dart';
import  'package:flutter/material.dart';
import '../main.dart';
import 'App_hist.dart';
import 'pF.dart';

class SecondScreen extends StatefulWidget {

  final List jsondata;

  SecondScreen({Key? key, required this.jsondata}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          leading: Icon(Icons.people),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color:Colors.indigo,

          child: ListView.builder(
              itemCount: widget.jsondata == null ? 0 : widget.jsondata.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage('assets/logo.png')),
                    Text('ID: '+widget.jsondata[index]['P_id'],style: TextStyle(
                      fontSize: 30,color:Colors.black,
                    ),),
                    SizedBox(height: 20,),

                    Text('First Name: '+widget.jsondata[index]['Fname'],style: TextStyle(
                      fontSize: 30,color:Colors.black,)),
                    SizedBox(height: 20,),

                    Text('Last Name: '+widget.jsondata[index]['Lname'],style: TextStyle(
                      fontSize: 30,color:Colors.black,)),
                    SizedBox(height: 20,),


                    Text('Email: '+widget.jsondata[index]['email'],style: TextStyle(
                      fontSize: 30,color:Colors.black,)),

                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DList()));
                        }, child: Text('Set Appointment')),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>FDList()));
                        }, child: Text('FollowUp')),
                        SizedBox(width: 10,),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AHP(list:widget.jsondata,index:index)));
                        }, child: Text('Previous')),

                      ],
                    ),
                    Row(children:[
                      SizedBox(width:40),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    }, child: Text('Logout')),
                      SizedBox(width:40),
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateP(list:widget.jsondata,index:index),
                          ),
                        );
                      }, child: Text('Update Profile')),
                  ]
                ),
                ]
                );
              }
          ),
        )
    );
  }
}
