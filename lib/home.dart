import 'package:flutter/material.dart';
import 'detail.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String linkApi = 'http://apinews.lokerprogrammer.com/';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response = await http.get(linkApi);
    return json.decode(response.body);
  }

  containerBerita(String datetime, String judul, String content, String image) {
    return MaterialButton(
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.red, width: 3),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Image.network(
                image,
                height: 100,
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(judul, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      datetime,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      splashColor: Colors.white,
      highlightColor: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              judul: judul,
              content: content,
              datetime: datetime,
              image: image,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Portal Berita')),
      body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return containerBerita(
                      snapshot.data[i]['waktu'] +
                          ' ' +
                          snapshot.data[i]['tanggal'],
                      snapshot.data[i]['judul'],
                      snapshot.data[i]['content'],
                      linkApi + 'img/' + snapshot.data[i]['image'],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
