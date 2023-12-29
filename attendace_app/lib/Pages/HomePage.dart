import 'package:attendace_app/Pages/QrScanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:attendace_app/Pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key});
  final String usrname;
  final String deviceId;
  final String semester;

  MyHomePage({
    Key? key,
    required this.usrname,
    required this.deviceId,
    required this.semester,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget profileCard(String _name, String _Devid, String _id, String _sem) {
    return Container(
      width: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                const TableCell(
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TableCell(
                  child: Text(
                    _name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const TableCell(
                  child: Text(
                    'Device Id',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TableCell(
                  child: Text(
                    _Devid,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const TableCell(
                  child: Text(
                    'Registration Id',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TableCell(
                  child: Text(
                    _id,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                const TableCell(
                  child: Text(
                    'Semester',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TableCell(
                  child: Text(
                    _sem,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome Home!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        elevation: 0.5,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage(
                        deviceId: widget.deviceId,
                      )),
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/svg/logout-svgrepo-com.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              // You can navigate to the QR scanner page or perform any other action here
              PermissionStatus cameraStatus = await Permission.camera.request();
              if (cameraStatus.isGranted) {
                print("Permission Camera is Granted");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRViewExample(),
                  ),
                );
              } else if (cameraStatus.isDenied) {
                print("Permission is Permanently Denied");
              } else if (cameraStatus.isPermanentlyDenied) {
                print("Permission is Permanently denied");
              }
            },
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                color: Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/svg/qr.svg',
                height: 20,
                width: 20,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            const Text(
              "Profile Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            profileCard(
                widget.usrname, widget.deviceId, "2100030053", widget.semester),
          ],
        ),
      ),
    );
  }
}
