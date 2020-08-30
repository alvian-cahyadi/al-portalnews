import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class RegistPage extends StatefulWidget {
  @override
  _RegistPageState createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();

  addDataUser(userController, passController, pass2Controller) {
    if (userController.text != '' &&
        passController.text != '' &&
        pass2Controller.text != '' &&
        passController.text == passController.text) {
      setState(() {
        var link = linkApi + "regist.php";
        http.post(link, body: {
          "username": userController.text,
          "password": passController.text
        });
      });
      Navigator.pop(context);
    } else {
      userController.text != '';
      passController.text != '';
      pass2Controller.text != '';
      FToast(context).showToast(
          toastDuration: Duration(milliseconds: 2000),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey,
            ),
            child: Text('Username or Password is invalid !!!'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registrasi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: userController,
                  decoration: InputDecoration(hintText: "username"),
                ),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: "password"),
                  obscureText: true,
                ),
                TextField(
                  controller: pass2Controller,
                  decoration: InputDecoration(hintText: "konfirmasi password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text('back', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 20),
                    FlatButton(
                      child: Text('Sign Up',
                          style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        addDataUser(
                            userController, passController, pass2Controller);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
