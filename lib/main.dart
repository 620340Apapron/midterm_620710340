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
        padding: const EdgeInsets.all(8.0),
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
                    Column(
                      children: [
                        Text('PIG WEIGHT',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.pink.shade600)),
                        Text(
                          'CALCULATOR',
                          style: TextStyle(
                            fontSize: 36.0,
                            color: Colors.pink.shade600,
                          ),
                        ),
                        const SizedBox(width: 50.0),
                        Image.asset('assets/images/pig.png', width: 300.0),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                        var lowprice = cal.getlow(weight);
                        var hightprice = cal.gethight(weight);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Result'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        'Weight: ${weight.round() - 3} - ${weight.round() + 3} kg'),
                                    Text(
                                        'Price: ${lowprice.round()} - ${hightprice.round()} Baht'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
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
                                title: const Text('Error!'),
                                content: const Text('Invalid input'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
