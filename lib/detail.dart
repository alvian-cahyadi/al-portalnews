import 'package:flutter/material.dart';
import 'home.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({this.judul, this.content, this.datetime, this.image});
  final String judul;
  final String content;
  final String datetime;
  final String image;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 80),
          child: ListView(
            children: [
              Text(
                widget.judul,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(widget.datetime,
                  style: TextStyle(fontWeight: FontWeight.w300)),
              SizedBox(height: 20),
              Image.network(widget.image, height: 200),
              Text(
                widget.content,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
