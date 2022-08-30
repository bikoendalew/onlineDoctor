import 'package:ee_health/doctor/update.dart';
import  'package:flutter/material.dart';
import 'allPatient.dart';
import '../main.dart';
import 'DFetch.dart';

class DoctorScreen extends StatefulWidget {

  final List jsondata;

  DoctorScreen({Key? key, required this.jsondata}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<DoctorScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text('Doctor Profile Page'),
          centerTitle: true,
          leading: Icon(Icons.people),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,

          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/bg.jpg'),fit: BoxFit.cover,
              )
          ),
          child: ListView.builder(
              itemCount: widget.jsondata == null ? 0 : widget.jsondata.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      child: Image.network(

                        "http://10.0.2.2/Jo Gato 1/Jo Gato 1/IU/${widget.jsondata[index]['img']}",width:600,height: 300,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70), // if you need this
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),

                    ),
                    Text('ID: '+widget.jsondata[index]['D_id'],style: TextStyle(
                      fontSize: 30,color:Colors.black,
                    ),),
                    SizedBox(height: 20,),

                    Text('Name: '+widget.jsondata[index]['Fname']+' '+widget.jsondata[index]['Lname']
                        ,style: TextStyle(
                      fontSize: 30,color:Colors.black,)),
                    Text('Email: '+widget.jsondata[index]['email'],style: TextStyle(
                      fontSize: 30,color:Colors.black,)),

                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>DR(list:widget.jsondata,index:index)));
                        },
                            color: Colors.white,
                            child: Text('Response',style: TextStyle(color: Colors.black),)),


                      ],
                    ),
                    SizedBox(height: 10,),
                    MaterialButton(onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => APList(),),);
                    },
                      color: Colors.white,
                      child:Text('All Patient',style:TextStyle(color: Colors.black)),
                    ),
                    MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                        color: Colors.white,
                        child: Text('Logout',style: TextStyle(color: Colors.black))),
                    SizedBox(height: 20,),
                    MaterialButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Update(list:widget.jsondata,index:index),
                        ),
                      );
                    },
                        color: Colors.white,
                        child: Text('Update Profile',style: TextStyle(color: Colors.black))),

                  ],
                );
              }
          ),
        )
    );
  }
}