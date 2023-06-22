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
  String emo="";
  String emo2="";
  List shayari=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    shayari=Data.s[widget.index];
    for(int i=0;i<shayari.length;i++)
      {
        emo=emoji(Data.e[widget.index]);
        emo2=emoji(Data.e[widget.index]);
        shayari[i]=emo+shayari[i]+emo2;
      }
  }
  emoji(List t) {
    List p=List.filled(10, null);
    for(int i=0;i<10;)
    {
      int r=Random().nextInt(t.length);
      if(!p.contains(r))
        {
          p[i]=t[r];
          i++;
        }
    }
      String q=p.toString();
      q=q.replaceAll(",", "");
      q=q.replaceAll("[", "");
      q=q.replaceAll("]", "");
      q=q+"\n";
    return q;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 24),),actions: [
        Icon(Icons.share),
        Icon(Icons.more_vert)
      ], ),
      body: ListView.separated(
        itemBuilder: (context, index) {
            return ListTile(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return view(widget.index,index);
              },));
            },
              minVerticalPadding: 10,
              tileColor: Colors.pink,
              leading: InkWell(onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return img(widget.index);
                },));
              }, child: Image.asset(Data.main_image[widget.index])),
              title: Text(shayari[index],maxLines: 2,style: TextStyle(fontSize:20)),
              trailing: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 20),
            );
          },
        separatorBuilder:(context, index) {
          return Divider(
            color: Colors.transparent,
            );
          },
          itemCount: shayari.length,
      ),
    );
  }
}
