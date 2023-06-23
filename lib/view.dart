import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_shayari/Data.dart';

class view extends StatefulWidget {
List a;
int index;

  view(this.a, this.index);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  List shayari = [];
  bool color=false;
  List co=Data.co;
  int R=0;

  rando()
  {
    R=Random().nextInt(Data.co.length-1);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 24),),),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container();
                      });
                }, icon: Icon(Icons.color_lens,size: 40,)),
                Text("${widget.index+1} / ${widget.a.length}",style: TextStyle(fontSize: 24)),
                IconButton(onPressed: () {
                  color=true;
                  rando();
                  setState(() {});
                }, icon: Icon(Icons.refresh_rounded,size: 40,)),
              ],
            ),
            SizedBox(height: 30,),
            Expanded(child: Container(padding: EdgeInsets.all(20),alignment: Alignment.center,decoration: BoxDecoration(
              gradient: LinearGradient(colors: (color ? [co[R],co[R+1],co[R+2]] : [Colors.pink,Colors.pink]))
            ),
                child: PageView.builder(
                  onPageChanged: (value) {
                    widget.index=value;
                    setState(() {});
                  },
                  controller: PageController(
                    initialPage: widget.index,),
                  itemCount: widget.a.length,
                  itemBuilder: (context, index) {
                    return Center(child: Text(widget.a[widget.index],style: TextStyle(fontSize: 36),));
                  },
                ),),
            ),
            SizedBox(height: 50,),
            Container(height: 70,margin:EdgeInsets.all(10),width: double.infinity, color: Colors.blueGrey,
              child: Wrap(alignment: WrapAlignment.spaceAround,children: [
                IconButton(onPressed: () {
                    widget.index>0 ? widget.index-- : widget.index;
                    setState(() {});
                  }, icon: Icon(Icons.arrow_back_ios_new_rounded,size: 50,)),
                IconButton(onPressed: () {
                  widget.index>0 ? widget.index-- : widget.index;
                  setState(() {});
                }, icon: Icon(Icons.edit,size: 50,)),
                IconButton(onPressed: () {
                  widget.index<widget.a.length ? widget.index++ : widget.index;
                  setState(() {});
                }, icon: Icon(Icons.arrow_forward_ios_sharp,size: 50,)),
                ],
            )),
            SizedBox(height: 50,),
          ],
        ));
  }
}
