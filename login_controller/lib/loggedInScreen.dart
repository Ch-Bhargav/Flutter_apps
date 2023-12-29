import 'package:flutter/material.dart';

class LoggedInPage extends StatefulWidget {
  final String Username;
  const LoggedInPage({
    Key? key,
    required this.usrname,
  }) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Logged In Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
