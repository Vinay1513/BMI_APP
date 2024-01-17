import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var fController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgcolor = Color.fromARGB(255, 114, 118, 167);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI APP'),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text('Enter you age in Kgs'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 11),
                    TextField(
                      controller: fController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height in feets'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 11),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text('Enter your Height in (inches)'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wtController.text.toString();
                          var ft = fController.text.toString();
                          var inch = inController.text.toString();
                          if (wt != "" && ft != "" && inch != "") {
                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);
                            var tInch = (iFt * 12) + iInch;
                            var tCm = tInch * 2.54;
                            var tM = tCm / 100;
                            var bmi = iWt / (tM * tM);
                            var msg = "";
                            if (bmi > 25) {
                              msg = "Your are OverWeight!!!";
                              bgcolor = Color.fromARGB(255, 207, 171, 7);
                            } else if (bmi < 18) {
                              msg = "Your are Underweight!!!";
                              bgcolor = Color.fromARGB(255, 150, 26, 26);
                            } else {
                              msg = "Your are Fit!!!";
                              bgcolor = const Color.fromARGB(255, 14, 167, 22);
                            }
                            setState(() {
                              result =
                                  "$msg \n Your BMI is:  ${bmi.toStringAsFixed(2)}";
                            });
                          } else {
                            setState(() {
                              result = "Please fill required fields ";
                            });
                          }
                        },
                        child: Text('Calculate')),
                    Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),
          ),
        ));
  }
}
