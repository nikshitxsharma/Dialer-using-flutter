// main.dart
import 'package:flutter/material.dart';

// import our custom number keyboard
import './num_pad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more))
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // display the entered numbers
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 50,
                child: Center(
                    child: TextField(
                  controller: _myController,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  // Disable the default soft keybaord
                  keyboardType: TextInputType.none,
                )),
              ),
            ),
            // implement the custom NumPad
            NumPad(
              buttonSize: 100,
              buttonColor: Colors.black,
              iconColor: Colors.deepOrange,
              controller: _myController,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              // do something with the input numbers
              onSubmit: () {
                debugPrint('Your code: ${_myController.text}');
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Text(
                            " DO YOU WANT TO MAKE CALL ON ${_myController.text}",
                            style: const TextStyle(fontSize: 25),
                          ),
                        ));
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Icon(
        Icons.contacts,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
