import 'package:flutter/material.dart';
import 'package:login_controller/loggedInScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usrnameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 350,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Login page",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: usrnameController,
                decoration: InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: pswdController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              ElevatedButton(
                onPressed: () {
                  String username = usrnameController.text;
                  String password = pswdController.text;

                  // Use the username and password as needed
                  print('Username: $username');
                  print('Password: $password');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoggedInPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Set background color
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 16)), // Set text style
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(15)), // Set padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                    ),
                  ),
                ),
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
