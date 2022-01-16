import 'package:flutter/material.dart';
import 'package:midterm_620710031/cal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pig Weight Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pig Weight Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/pig.png', height: 300, width: 200),
                  Expanded(
                    child: Container(
                      child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: TextField(
                                  controller: _controller1,
                                  decoration: InputDecoration(
                                    filled: true,
                                  border: OutlineInputBorder(),
                                  labelText: 'Length (cm)',
                                  hintText: 'Enter Length',
                                ),
                              ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: const SizedBox(
                              width: 300,
                              height: 50,
                              child: TextField(
                                controller: _controller2,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Girth (cm)',
                                  hintText: 'Enter Girth',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextButton(
                      child: Text('Calculate'),
                      style: TextButton.styleFrom(
                          primary: Colors.white, backgroundColor: Colors.pink),
                      onPressed: () {
                        var input1 = _controller1.text;
                        var input2 = _controller2.text;
                        var length = double.tryParse(input1!);
                        var girth = double.tryParse(input2!);
                        if (length == null || girth == null) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'กรอกข้อมูลไม่ถูกต้อง กรุณากรอกใหม่'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                        }
                        var weigth = girth! * girth! * length! * 69.3;
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Result'),
                                  content:
                                      Text(' Weigth: $weigth kg'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                );
                              });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
