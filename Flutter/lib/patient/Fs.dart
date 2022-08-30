
import 'package:ee_health/patient/pF.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class SetF extends StatefulWidget {
  final List list;
  final int index;
  SetF({required this.list, required this.index});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SetF> {
  final GlobalKey<FormState>_key=GlobalKey<FormState>();
  TextEditingController p_id = TextEditingController();
  TextEditingController P_case = TextEditingController();

  bool editMode = false;

  Future SetFP() async {
    var url = Uri.parse("http://10.0.2.2/flutter/sendFD.php");
    var response = await http.post(url, body: {
      'D_id': widget.list[widget.index]['D_id'],
      'P_id': p_id.text,
      'P_case': P_case.text,

    });
    Fluttertoast.showToast(
        msg: "Send Succesful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
        context, MaterialPageRoute(builder: (Context) => FDList()));


  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send to Doctor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
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
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Your P_id',
                    prefixIcon: Icon(Icons.label),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: p_id,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty)return "Field is Required";
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'your case',
                    prefixIcon: Icon(Icons.text_fields),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  controller: P_case,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Colors.pink,
                      child: Text('set',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      onPressed: () {
                        if(_key.currentState!.validate()){
                          _key.currentState!.save();
                          SetFP();
                        }

                      },
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
