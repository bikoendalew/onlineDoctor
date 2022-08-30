import 'dart:convert';

import 'package:ee_health/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController Ename = TextEditingController();
  TextEditingController Econtact = TextEditingController();

  Future register() async {
    var url = Uri.parse("http://10.0.2.2/flutter/RegPat.php");
    var response = await http.post(url, body: {
      'First_Name':Fname.text,
      'Last_Name':Lname.text,
      'email': email.text,
      'password': pass.text,
      'contact':contact.text,
      'age':age.text,
      'Emerg_name':Ename.text,
      'Emerg_contact':Econtact.text,
      'Sex':sex.text
    });

    if (response.statusCode==200) {
      // ignore: use_build_context_synchronously
      Fluttertoast.showToast(
          msg:"Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Patient(),
          ));
    } else {
      Fluttertoast.showToast(
          msg: "Not Registerd",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Patient(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'SignUp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
      key: _key,
        child: Container(


          width: double.infinity,
          height: double.infinity,

           color:Colors.blueGrey,
            child: ListView(
              children: <Widget>[
                Text(
                    'Register',

                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                TextFormField(

                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  controller: Fname,
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },

                ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            validator: (value){
              if(value==null||value.isEmpty)return "Field is Required";
              return null;
            },
            controller: Lname,
          ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    String pattern=r'\w+@\w+\.\w+';
                    if(!RegExp(pattern).hasMatch(value))
                      return 'Invalid E-mail Address format.';

                    return null;
                  },
                    decoration: InputDecoration(
                      labelText: 'email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: email,

                ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    controller: pass,

                ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: contact,
                ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  controller: age,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sex',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  controller:sex,
                ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Emergency Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ), controller: Ename,
                ),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Emergency Contact',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                   controller: Econtact,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Colors.pink,
                        child: Text('Register',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          if(_key.currentState!.validate()){
                            _key.currentState!.save();

                            register();
                          }

                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.pink,
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
String? validateText(String textform){
if(textform.isEmpty)return 'Feild is Required';
return null;
}
