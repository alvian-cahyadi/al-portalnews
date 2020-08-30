import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KategoriPage extends StatefulWidget {
  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  iconTag(Icon icon, String tag) {
    return IconButton(
      icon: icon,
      onPressed: () {
        FToast(context).showToast(
            toastDuration: Duration(milliseconds: 2000),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey,
              ),
              child: Text('Anda memilih kategori ' + tag),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Kategori Page')),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Column(
                  children: [
                    Text('General'),
                    Container(height: 1.5, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconTag(Icon(Icons.attach_money), 'General'),
                        iconTag(Icon(Icons.card_travel), 'General'),
                        iconTag(Icon(Icons.local_hospital), 'General'),
                      ],
                    )
                  ],
                ),
              ),
              // Row ke 2
              SizedBox(
                height: 6.0,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Column(
                  children: [
                    Text('Life Stock'),
                    Container(height: 1.5, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconTag(Icon(Icons.fastfood), 'Life Stock'),
                        iconTag(Icon(Icons.hotel), 'Life Stock'),
                        iconTag(Icon(Icons.local_grocery_store), 'Life Stock'),
                        iconTag(Icon(Icons.local_movies), 'Life Stock'),
                      ],
                    )
                  ],
                ),
              ),
              // Row ke 3
              SizedBox(
                height: 6.0,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Column(
                  children: [
                    Text('Transportation'),
                    Container(height: 1.5, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconTag(Icon(Icons.directions_bike), 'Transportation'),
                        iconTag(Icon(Icons.motorcycle), 'Transportation'),
                        iconTag(Icon(Icons.directions_car), 'Transportation'),
                        iconTag(Icon(Icons.local_shipping), 'Transportation'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconTag(Icon(Icons.directions_bus), 'Transportation'),
                        iconTag(Icon(Icons.directions_boat), 'Transportation'),
                        iconTag(Icon(Icons.train), 'Transportation'),
                        iconTag(
                            Icon(Icons.airplanemode_active), 'Transportation'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
