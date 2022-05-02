import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Converter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double number = 0;
  String result = '';
  bool dataIsEntered = false;

  double convert_miles(double number) => (number / 1.609);
  double convert_kms(double number) => (number * 1.609);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
            margin: EdgeInsets.only(left: 55, right: 55),
            child: TextField(
              decoration: InputDecoration(hintText: 'Input....'),
              keyboardType: TextInputType.number,
              onChanged: (String number) {
                if (number.isNotEmpty) {
                  this.number = double.parse(number.replaceAll(",", '.'));
                  if (this.number != null) {
                    setState(() {
                      dataIsEntered = true;
                    });
                  }
                } else {
                  this.number = 0;
                  setState(() {
                    dataIsEntered = false;
                  });
                }
              },
            )),
        SizedBox(
          height: 150,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
            child: Text("Kilometers to Miles"),
            onPressed: dataIsEntered
                ? () {
                    setState(() {
                      result = convert_miles(number).toString();
                    });
                  }
                : null,
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            child: Text("Miles to Kilometers"),
            onPressed: dataIsEntered
                ? () {
                    setState(() {
                      result = convert_kms(number).toString();
                    });
                  }
                : null,
          ),
        ]),
        SizedBox(
          height: 50,
          width: 50,
        ),
        Row(children: [
          Expanded(
            child: Text(
              "Result is: $result",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          )
        ])
      ],
    ));
  }
}
