import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _girthcontroller = TextEditingController();
  final _lengthcontroller = TextEditingController();
  var cal = Calculator();
  String? _girth;
  String? _length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/pig.png', width: 100.0),
                      Column(
                        children: [
                          Text('PIG WEIGHT',
                              style: TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.pink.shade600)),
                          Text(
                            'CALCULATOR',
                            style: TextStyle(
                              fontSize: 36.0,
                              color: Colors.pink.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _girthcontroller,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.7),
                                border: const OutlineInputBorder(),
                                hintText: 'Enter length'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: _lengthcontroller,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.7),
                                border: const OutlineInputBorder(),
                                hintText: 'Enter girth'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: Text('CALCULATE'),
                      onPressed: () {
                        _girth = _girthcontroller.text;
                        _length = _lengthcontroller.text;
                        double? girth = double.tryParse(_girth!);
                        double? length = double.tryParse(_length!);
                        if (girth != null && length != null) {
                          var weight = cal.getweight(girth, length);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Result'),
                                content: Text('Weight: ${weight.round() - 3} - ${weight.round() + 3} kg'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          _girthcontroller.clear();
                          _lengthcontroller.clear();
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error!'),
                                  content: Text('Invalid input'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        }
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
