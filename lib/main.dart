import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      // theme: ThemeData(
      //   // primaryColor: Colors.lightBlue[800],
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      //   useMaterial3: true,
      // ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(appBar: AppBar(title: Text('Hello World!')));
    return Scaffold(
        appBar: AppBar(title: Text('Example title')), body: TextInputWidget());
  }
}

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(newText) {
    if (newText == "clr") {
      controller.clear();
      newText = "";
    }
    setState(() {
      this.text = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message), labelText: "Type a message"),
          onChanged: (text) => this.changeText(text),
        ),
        Text(this.text)
      ],
    );
  }
}
