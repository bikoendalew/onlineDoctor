import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'FR.dart';


void run() {
  runApp(MaterialApp(home: DF()));
}

class DF extends StatefulWidget {
  const DF({Key? key}) : super(key: key);

  @override
  State<DF> createState() => _AhistState();
}

class _AhistState extends State<DF> {
  List PList = [];
  fetchData() async {
    var url = Uri.parse("http://10.0.2.2/flutter/fh.php");
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
          title: Text('FollowUp Page'),
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
                        'F ID: ' + PList[index]['f_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'patient\'s ID : ' + PList[index]['P_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Doctor\'s ID: ' + PList[index]['D_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Patient Question : ' + PList[index]['P_case'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Doctor\'s Answer : ' + PList[index]['D_ans'],
                        style: TextStyle(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:
                              (contex)=>SetFR(list:PList,index:index)


                          ));

                        },
                        child: Text('Response',
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
