import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'main.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void initState() {
    super.initState();
    startLaunch();
  }

  Future<void> startLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var login = prefs.getInt('login');
    if (login != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return MyApp(initialPage: 0);
      }));
    }
  }

  Future<List> getData() async {
    final response = await http.get(linkApi + "login.php");
    return json.decode(response.body);
  }

  Future<void> cekLogin(
      List data, String userController, String passController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int login = 0;
    for (var i = 0; i < data.length; i++) {
      if (data[i]['username'] == userController &&
          data[i]['password'] == passController) {
        login = 1;
      }
    }
    if (login == 1) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        prefs.setString('login', userController);
        return MyApp(initialPage: 0);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                ); //untuk tampilan tidak ada data di db
              } else {
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: userController,
                          decoration: InputDecoration(hintText: "username"),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passController,
                          decoration: InputDecoration(hintText: "password"),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Back',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(width: 20),
                            FlatButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                cekLogin(snapshot.data, userController.text,
                                    passController.text);
                              },
                              child: Text('Login',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
