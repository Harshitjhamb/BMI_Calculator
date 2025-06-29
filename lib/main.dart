import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Controllerone = TextEditingController();
  var Controllertwo = TextEditingController();
  var Controllerthree = TextEditingController();
  var result = "";
  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFBDB395),
        title: Center(child: Text('BMI Calculator',style: TextStyle(fontFamily: 'Font1' , fontWeight: FontWeight.bold , decorationColor: Colors.pink , fontSize: 25),)),
      ),
      body: Container(
        color: Color(0xFFBDB395),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 250,
                  child: Column(
                    children: [
                      Text(
                        'Body Mass Index ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: "Font1",
                        ),
                      ),
                      SizedBox(height: 39),
                      TextField(
                        controller: Controllerone,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.fitness_center_rounded,
                            size: 20,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.pink,
                            ),
                          ),
                          label: Text('Enter your weight (kgs)',style: TextStyle(fontSize: 13),),
                          labelStyle: TextStyle(fontFamily: 'Font1')
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 18),
                      TextField(
                        controller: Controllertwo,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.accessibility_new,
                            size: 20,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.orange.shade200,
                            ),
                          ),
                          label: Text('Enter your height(feet)',style: TextStyle(fontFamily:'Font1' , fontSize: 13),),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 18),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: Controllerthree,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.accessibility_new,
                            size: 20,
                            color: Colors.black,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.orange.shade200,
                            ),
                          ),
                          label: Text('Enter your height(inch)',style: TextStyle(fontFamily:'Font1' , fontSize: 13),),
                        ),
                      ),
                      SizedBox(height: 18),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          shadowColor: Color(0xFFF2E2B1),
                          elevation: 10,
                          backgroundColor: Color(0xFFBDB395),
                        ),
                        onPressed: () {
                          var wt = Controllerone.text.toString();
                          var ft = Controllertwo.text.toString();
                          var inch = Controllerthree.text.toString();
                          if (wt != "" && inch != "" && ft != "") {
                            var iwt = int.parse(wt);
                            var iInch = int.parse(inch);
                            var ift = int.parse(ft);
                            var tinch = (ift * 12) + iInch;
                            var tCm = tinch * (2.54);
                            var tm = tCm / 100;
                            var bmi = iwt / (tm * tm);
                            var msg = "";
                            setState(() {
                              if (bmi > 25) {
                                msg = "....You are Overweight....";
                                bgcolor = Color(0xFFEA7300);
                              } else if (bmi < 18) {
                                msg = "....You are Underweight....";
                                bgcolor = Color(0xFFEA2F14);
                              } else {
                                msg = "....You are Healthy....";
                                bgcolor = Color(0xFF1F7D53);
                              }
                              result =
                                  "${msg} \n  Your BMI is ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            result = "PLease fill all the details ";
                            bgcolor = Color(0xFFC5172E);
                            setState(() {});
                          }
                        },
                        child: Text(
                          "Calculate BMI",
                          style: TextStyle(fontFamily: "Font1", fontSize:18),
                        ),
                      ),
                      SizedBox(height: 18),
                      Center(
                        child: Text(
                          result,
                          style: TextStyle(
                            color: bgcolor,
                            fontFamily: 'Font1',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
