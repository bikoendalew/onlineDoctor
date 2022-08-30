import 'package:ee_health/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




class SetFR extends StatefulWidget {
  final List list;
  final int index;
  SetFR({required this.list, required this.index});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SetFR> {
  final GlobalKey<FormState>_key=GlobalKey<FormState>();
  TextEditingController D_ans= TextEditingController();

  bool editMode = false;

  Future SetFP() async {
    var url = Uri.parse("http://10.0.2.2/flutter/DFres.php");
    var response = await http.post(url, body: {
      'f_id': widget.list[widget.index]['f_id'],
      'D_ans': D_ans.text,
    });

        Navigator.pop(context);
    Fluttertoast.showToast(
        msg:'Send Succesful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);

  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Doctor Response',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key:_key,
        child: ListView(children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Send Message',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                 validator: (value){
                   if(value==null||value.isEmpty)return "Feild is Required";
                   return null;
                 },
                  decoration: InputDecoration(
                    labelText: 'Answer',
                    prefixIcon: Icon(Icons.chat),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: D_ans,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.green,
                      child: Text('Send',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                if(_key.currentState!.validate()){
             _key.currentState!.save();

             SetFP();
                      }}

                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
