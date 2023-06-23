import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_shayari/Data.dart';
import 'package:love_shayari/main.dart';
import 'package:love_shayari/view.dart';

class list extends StatefulWidget {
  int index;

  list(this.index);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  String emo = "";
  String emo2 = "";
  List shayari = [];
  List shay = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    shayari=Data.s[widget.index];
  }

  emoji(List t) {
    List p = List.filled(1, null);
    for (int i = 0; i < 1;) {
      int r = Random().nextInt(t.length);
      if (!p.contains(r)) {
        p[i] = t[r];
        i++;
      }
    }
    String q = "";
    q = p.toString();
    q = q.replaceAll(",", "");
    q = q.replaceAll("[", "");
    q = q.replaceAll("]", "");
    q = q + "\n";
    return q;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "Love Shayari",
              style: TextStyle(fontSize: 24),
            )),
        body: ListView.builder(
          itemCount: shayari.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset("${Data.main_image[widget.index]}"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return view(shayari,index);
                  },));
                },
                title: Text(
                  "${shayari[index]}",
                  maxLines: 1,
                ),
              ),
            );
          },
        ));
  }
}
