import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<bool> visible = [false, false, false];
  String first = "";
  String second = "";

  // int first = 0;

  // int second = 0;
  String result = "";
  void Add(int index) {
    setState(() {
      for (int i = 0; i < visible.length; i++) {
        if (i == 0) {
          visible[i] = !visible[i];
        } else {
          visible[i] = false;
        }
      }
      result = (int.parse(first) + int.parse(second)).toString();
    });
  }

  void Subtract(int index) {
    for (int i = 0; i < visible.length; i++) {
      if (i == 1) {
        visible[i] = !visible[i];
      } else {
        visible[i] = false;
      }
    }
    setState(() {
      result = (int.parse(first) - int.parse(second)).toString();
    });
  }

  void Multiply(int index) {
    setState(() {
      for (int i = 0; i < visible.length; i++) {
        if (i == 2) {
          visible[i] = !visible[i];
        } else {
          visible[i] = false;
        }
      }
      result = (int.parse(first) * int.parse(second)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              onChanged: (val) {
                first = val;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Enter First Number',
                labelStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              onChanged: (val) {
                second = val;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Enter Second Number',
                labelStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () => Add(1),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () => Subtract(2),
                    child: const Text(
                      "Subtract",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () => Multiply(3),
                    child: const Text(
                      "Multiply",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
          if (visible[0])
            SizedBox(
              height: 40,
              child: Text(
                'The sum is $result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          if (visible[1])
            SizedBox(
              height: 40,
              child: Text(
                'The difference is $result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          if (visible[2])
            SizedBox(
              height: 40,
              child: Text(
                'The product is $result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
