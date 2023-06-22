import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  int ind,index;
  view(this.ind,this.index);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 24),),actions: [
          Icon(Icons.share),
          Icon(Icons.more_vert)
        ], ),
        body: Column(children: [
            Expanded(child: Center(child: Text(""),)),
            PageView.builder(itemBuilder: (context, index) {
              return Container() ;
            },)
        ]),
    );
  }
}
