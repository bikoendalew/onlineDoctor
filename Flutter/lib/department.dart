import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E Health System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const De(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class De extends StatefulWidget {
  const De({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<De> {

  // Initial Selected Value
  String dropdownvalue = 'Surgery';
  String dr='Internal Medicine';
  String d='Ophthalmology Clinic Glaucoma';
  String dd='Dermatology and Venereology';
  // List of items in our dropdown menu
  var items = [
    'Surgery',
    'General Surgery',
    'Hepatobiliaryn Surgery',
    'Colorectal surgery',
    'Pediatric Surgery',
    'Thoracic Surgery',
    'Urology',
    'Endocrine Surgery',
    'Plastic Surgery',
    'Neurosurgery'

  ];
  var item = [
    'Internal Medicine',
    'Neurology',
    ' Pulmonology',
    'Gastro-enterology Clinic',
    'Nephrology',
    'Endocrinology',
  ];
  var it=[
    'Ophthalmology Clinic Glaucoma',
    'Occuloplasty',
    'Oncology Clinic',
    'Critical Care Unit',
    'Intensive Care Unit (ICU)',
    'Neonatal Intensive Care Unit',
  ];
  var i=[
    'Dermatology and Venereology',
    'Psychiatry',
    'Dentistry Clinic',
    'Physiotherapy',
    'ART and Tuberculosis clinic',
    'Laboratory',
    'Pharmacy',
    'Operation Service'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Departments"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
color:Colors.indigo,
        child: ListView(
         children:[
           Image.asset('assets/logo.png'),
           Column(

                children: [

                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 30,
            elevation: 16,
            style: TextStyle(color: Colors.grey),
            underline: Container(

              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              )),
                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 15,color: Colors.black),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  DropdownButton(

                    // Initial Value
                    value: d,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    elevation: 16,
                    style: TextStyle(color: Colors.grey),
                    underline: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                        )),
                    // Array list of items
                    items: it.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 15,color: Colors.black),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        d = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  DropdownButton(

                    // Initial Value
                    value: dd,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    elevation: 16,
                    style: TextStyle(color: Colors.grey),
                    underline: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                        )),
                    // Array list of items
                    items: i.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 15,color: Colors.black),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dd = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 20,),
                  DropdownButton(

                    // Initial Value
                    value: dr,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 30,
                    elevation: 16,
                    style: TextStyle(color: Colors.grey),
                    underline: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          ),
                        )),
                    // Array list of items
                    items: item.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: TextStyle(fontSize: 15,color: Colors.black),),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dr = newValue!;
                      });
                    },
                  ),



                ],
              ),
  ]
        ),
      ),

    );
  }
}