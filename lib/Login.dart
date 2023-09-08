import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arifs Blogs'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = new TextEditingController();

  void click() {
    name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(name: this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: "Type Your Name",
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: Colors.black)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.done),
                splashColor: Color.fromARGB(255, 71, 42, 216),
                tooltip: "Submit",
                onPressed: () => {click()},
              ),
            ),
          ),
        ));
  }
}
