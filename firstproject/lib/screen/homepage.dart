import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title;

  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();
  double total = 0;

  @override
  void initState() {
    title = "Welcome to Homepage";
    number1.text = "0";
    number2.text = "0";
    super.initState();
  }

  void handleAddition() {
    setState(() {
      total = double.parse(number1.text) + double.parse(number2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text(title!)),

          TextField(controller: number1),
          TextField(controller: number2),
          Center(child: Text("$total")),
          ElevatedButton(
            onPressed: () {
              handleAddition();
            },
            child: Text("Addition"),
          ),
        ],
      ),
    );
  }
}
