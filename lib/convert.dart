import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function convertHandler;

  const Convert({ Key? key, required this.convertHandler }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: ElevatedButton(
        onPressed: () {
          convertHandler();
        },
        child: Text(
          'Konversi Suhu',
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}