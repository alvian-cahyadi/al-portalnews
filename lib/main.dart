import 'package:alnews/home.dart';
import 'package:alnews/kategori.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';
import 'kategori.dart';
import 'profil.dart';

void main() {
  runApp(MyApp(initialPage: 0));
  // ini ngambil function yg pertama kali pengen
  // dimunculin klo ada login dulu ya lari ke class login
  // baik di 1 file main.dart atau di lain file .dart
}

class MyApp extends StatefulWidget {
  const MyApp({this.initialPage});
  final int initialPage;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;
  final _pageOption = [KategoriPage(), HomePage(), ProfilPage()];
  @override
  void initState() {
    super.initState();
    setState(() {
      _page = widget.initialPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal News AlNews',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SafeArea(
        child: Scaffold(
          body: _pageOption[_page],
          bottomNavigationBar: CurvedNavigationBar(
            height: 48.0,
            color: Colors.red,
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            items: <Widget>[
              Icon(Icons.category, color: Colors.white),
              Icon(Icons.home, color: Colors.white),
              Icon(Icons.account_circle, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
