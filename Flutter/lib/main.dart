
import 'package:ee_health/admin/adminL.dart';
import 'package:ee_health/feedback.dart';
import 'package:ee_health/patient/patient.dart';
import 'package:flutter/material.dart';
import 'Location.dart';
import 'department.dart';
import 'doctor/Dlogin.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Health System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool?> showWarning(BuildContext context) async=>showDialog<bool>(
      context:context,
      builder:(context)=>AlertDialog(title:Text('Do you want to exit app?'),
        actions: [
          TextButton(
              child:Text('No'),
              onPressed:()=>Navigator.pop(context,false)
          ),
          TextButton(
              child:Text('Yes'),
              onPressed:()=>Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()))
          )
        ],

      )
  );



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final shouldPop=await showWarning(context);
        return shouldPop??false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Image(image: AssetImage('assets/logo.png')),
          title: Text(
            'WELCOME',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body:  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/bg.jpg'),fit: BoxFit.cover,
              )
          ),


          child: ListView(

              children:[ Column(


                children: <Widget>[

                  Image(image:AssetImage('assets/logo.png'),width: 250,height: 300,),


                      RaisedButton(


                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Patient()));
                          },
                          child: Text('Patient',
                              style:
                              TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),



                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(

                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Doctor()));
                      },
                      child: Text('Doctor',
                          style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AdminL()));
                      },
                      child: Text('Admin',
                          style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                  SizedBox(height: 20,),
                  RaisedButton(

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Le()));
                      },
                      child: Text('Contact',style:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => De()));
                          },
                          child: Text('Our Departments',
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                      RaisedButton(

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>Fk()));
                          },
                          child: Text('Feedback',
                              style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                    ],
                  )
                ],
              ),
              ]
          ),
        ),

      ),
    );
  }
}
