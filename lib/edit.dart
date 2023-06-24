import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class edit extends StatefulWidget {

  edit(index);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child:
          Container(
            color: Colors.yellow,
            height:double.infinity,
          child: Text("${widget.a[widget.index]}"),),),

          Expanded(child:
          Container(
            color: Colors.red,
            height: double.infinity,),),
        ],
      ),
    );
  }
}
