import 'package:flutter/material.dart';

import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:attendace_app/Pages/Login.dart';

class MyApp extends StatelessWidget {
  final deviceInfoPlugin = DeviceInfoPlugin();

  // Functions
  Future<String?> getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      return info.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
      return info.identifierForVendor;
    } else {
      return "Device ID not available on this platform";
    }
  }

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "KL University Attendance System",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      String? id = await getDeviceId();
                      print(id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                            deviceId: id ?? "N/A",
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[900],
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
