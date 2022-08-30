import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'sE.dart';



void run() {
  runApp(MaterialApp(home: DAList()));
}

class DAList extends StatefulWidget {
  const DAList({Key? key}) : super(key: key);

  @override
  State<DAList> createState() => _AhistState();
}

class _AhistState extends State<DAList> {
  List PList = [];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/docList.php");
    var response = await http.get(url);
    setState(() {
      PList = jsonDecode(response.body);
    });

    return PList;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Doctors'),
        ),
        body: ListView.builder(
          itemCount: PList.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Image.network(

                          "http://10.0.2.2/Jo Gato 1/Jo Gato 1/IU/${PList[index]['img']}",width:600,height: 300,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100), // if you need this
                          side: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),

                      ),
                      Text(
                        'Doctor\'s ID: ' + PList[index]['D_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Doctor\'s Name: ' + PList[index]['Fname']+' '+PList[index]['Lname'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Email: ' + PList[index]['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetD(
                                list: PList,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Text('Delete',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.blueGrey,
                                backgroundColor: Colors.black)),
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
