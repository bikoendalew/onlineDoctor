import 'package:ee_health/admin/AddDoctor.dart';
import 'package:ee_health/admin/allPatient.dart';
import 'package:ee_health/admin/feedReport.dart';
import 'package:ee_health/main.dart';
import 'package:flutter/material.dart';

import 'AFH.dart';
import 'AH.dart';
import 'EditD.dart';

class AdminD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [

            Icon(Icons.person),
          ],
          title: Text('Admin HomePage'
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color:Colors.indigo,
          ),
          child: Center(
            child:ListView(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/logo.png'),height: 250,),
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AD(),),);
                  }, child:Text('Appointment History',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                 ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AF(),),);
                  }, child:Text('Follow UP History',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                   ),
                  SizedBox(height: 10,),
                 ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DAList(),),);
                  }, child:Text('Delete Doctor',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                  ),
                    SizedBox(height: 10,),

              ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterD(),),);
                  }, child:Text('Add Doctor',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                    ),
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FReport()),);
                  }, child:Text('Feedback',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => APList(),),);
                  }, child:Text('All Patient',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20,),
                  IconButton(
                    icon:Icon(Icons.logout,size: 40,),
                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder: (Context)=>MyHomePage()));
                    },
                    color: Colors.redAccent,),

                ]
            ),),)
    );
  }
}
