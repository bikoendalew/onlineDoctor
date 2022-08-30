import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Fs.dart';


void run() {
  runApp(MaterialApp(home: FDList()));
}

class FDList extends StatefulWidget {
  const FDList({Key? key}) : super(key: key);

  @override
  State<FDList> createState() => _AhistState();
}

class _AhistState extends State<FDList> {
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
          leading:IconButton(
            onPressed:() {
              Navigator.pop(context);
            },
            icon:Icon(Icons.home),
          ),
          title: Text('Follow up'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: PList.length,
          itemBuilder: (context, index) {
            return Card(
                color:Colors.indigo,
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

                          "http://10.0.2.2/Jo Gato 1/Jo Gato 1/IU/${PList[index]['img']}",width:500,height: 300,),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60), // if you need this
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                            width: 1,
                          ),
                        ),

                      ),
                      Text(
                        'Doctor\'s ID: ' + PList[index]['D_id'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Doctor\'s Name: ' + PList[index]['Fname']+' '+ PList[index]['Lname'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('Department: '+PList[index]['department'],
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Email: ' + PList[index]['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SetF(
                                list: PList,
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Text('Send',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                ),
                        )
                      )
                    ],
                  ),
                ));
          },
        ));
  }
}
