
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'Dlogin.dart';




class Update extends StatefulWidget {
  final List list;
  final int index;
  Update({required this.list, required this.index});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Update> {
  final GlobalKey<FormState>_key=GlobalKey<FormState>();
  bool editMode=false;
  File? _image;
  final picker = ImagePicker();

  TextEditingController Fname = TextEditingController();
  TextEditingController Lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController department = TextEditingController();
  //choice Image
  Future choiceImage()async{
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage!.path);
    });
  }

  Future update() async {

    var uri = Uri.parse("http://10.0.2.2/flutter/updateD.php");
    var request = http.MultipartRequest('POST',uri);
    request.fields['D_id']=widget.list[widget.index]['D_id'];
    request.fields['First_Name'] = Fname.text;
    request.fields['Last_Name'] = Lname.text;
    request.fields['email']=email.text;
    request.fields['password']=pass.text;
    request.fields['contact'] = contact.text;
    request.fields['department'] = contact.text;
    var pic = await http.MultipartFile.fromPath("image", _image!.path);
    request.files.add(pic);
    var response = await request.send();

    if(response.statusCode==200){
      Fluttertoast.showToast(
          msg: "Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context,MaterialPageRoute(builder: (Context)=>Doctor()));
    }
    else if(response.statusCode==404){
      Fluttertoast.showToast(
          msg: "Error",
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

    editMode=true;

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        width:double.infinity,
        height: double.infinity,
        color:Colors.lightBlueAccent,
        child: Form(
          key:_key,
          child: ListView(

            children: <Widget>[
              TextFormField(
                validator:(value){
                  if(value==null||value.isEmpty)return "Field is Required";
                  return null;
        },
                decoration: InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: Fname,
              ),
              TextFormField(
                validator:(value){
                  if(value==null||value.isEmpty)return "Field is Required";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: Lname,
              ),

              TextFormField(
                validator:(value){
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
                validator:(value){
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
                validator:(value){
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
                validator:(value){
                  if(value==null||value.isEmpty)return "Field is Required";
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Department',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                controller: department,

              ),
              Text('Choose Image'),
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {
                  choiceImage();
                },
              ),
              Container(
                  child:_image==null? Text('no Image Selectd'):Image.file(_image!),width:40,height:40),
              SizedBox(height: 20,),
              Row(
          children:[
              MaterialButton(
                color: Colors.pink,
                child: Text('Update',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  if(_key.currentState!.validate()) {
                   _key.currentState!.save();
                    update();
                  }
                },
              ),
              SizedBox(width: 40,),
              MaterialButton(
                color: Colors.pink,
                child: Text('Back',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Doctor()));
                },
              ),]),

            ],
          ),
        ),
      ),



    );
  }
}