import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';





void run() {
  runApp(MaterialApp(home: APList()));
}

class APList extends StatefulWidget {
  const APList({Key? key}) : super(key: key);

  @override
  State<APList> createState() => _AhistState();
}

class _AhistState extends State<APList> {
  List PList = [];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/allPatient.php");
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
          title: Text('List of Patients'),
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
                      Text(
                        'Patient\'s ID: ' + PList[index]['P_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Patient\'s Name: ' + PList[index]['Fname']+' '+PList[index]['Lname'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Email: ' + PList[index]['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Sex: ' + PList[index]['Sex'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Contact: ' + PList[index]['contact'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Emergency\'s Name: ' + PList[index]['Emerg_name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Emergency\'s Contact: ' + PList[index]['Emerg_contact'],
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('Home',
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
