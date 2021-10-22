
import 'package:flutter/material.dart';
import 'package:konversi_suhu/input.dart';
import 'package:konversi_suhu/result.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputSuhuController = TextEditingController();

  // Dynamic variable
  double _inputUser = 0;
  double _result = 0;

  String _newValue = "Kelvin";

  var listItem = ["Kelvin", "Reamur","Fahrenheit"];

  void _temperatureConversion() {
    setState(() {
      _inputUser = double.parse(inputSuhuController.text);

      if (_newValue == "Kelvin") {
        _result = _inputUser + 273;
      } else if (_newValue == "Reamur") {
          _result = (4 / 5) * _inputUser;
      } else {
         _result = (9 / 5) * _inputUser;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konversi Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputSuhuController: inputSuhuController),
              Container(
                margin: EdgeInsets.only(top: 16),
                width: 256,
                child: DropdownButton<String>(
                  isExpanded: true,
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String? changeValue) {
                    setState(() {
                      _newValue = changeValue!;
                    });
                  },
                ),
              ),
              Result(
                result: _result,
              ),
              Convert(
                convertHandler: _temperatureConversion,
              ),
              Container(),
              Expanded(
                child: ListView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
