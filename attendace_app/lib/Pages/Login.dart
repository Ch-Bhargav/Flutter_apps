import 'package:attendace_app/Pages/Proceed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendace_app/Pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  final String deviceId;

  const LoginPage({Key? key, required this.deviceId}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usrnameController = TextEditingController();
  final pswdController = TextEditingController();

  final String adminUsrName = "admin";
  final String adminPswd = "root";

  // Login Handle Code
  void _handleLogin() {
    String usrname = usrnameController.text;
    String pswd = pswdController.text;
    if (usrname.isEmpty || pswd.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter both username and password"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Stop further execution if fields are empty
    }
    if (usrname == adminUsrName && pswd == adminPswd) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            usrname: "$usrname",
            deviceId: widget.deviceId,
            semester: "3-2",
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Invalid username or password"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

//********************************************************************************************************

  @override
  void initState() {
    super.initState();
    // Lock the orientation to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // Allow all orientations when the widget is disposed
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  "assets/logo.png", // Replace with your logo image
                  width: 70,
                  height: 70,
                ),
              ),
              const SizedBox(height: 20),
              _header(),
              _inputField(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // Widgets

  Widget _header() {
    return Column(
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Image.asset(
          "assets/background.png", // Replace with your image asset
          height: 200,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _inputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Username
        TextField(
          controller: usrnameController,
          decoration: InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.red[100],
            filled: true,
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),

        // Password
        TextField(
          controller: pswdController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.red[100],
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),

        // Login Button
        ElevatedButton(
          onPressed: _handleLogin,
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.red[900],
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
