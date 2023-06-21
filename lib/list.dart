import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_shayari/Data.dart';

class list extends StatefulWidget {
  int index;
  list(this.index);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 24),),actions: [
        Icon(Icons.share),
        Icon(Icons.more_vert)
      ], ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(

              leading: Image.asset(Data.main_image[widget.index]),
              title: Text(Data.one[index],maxLines: 1,style: TextStyle(fontSize:24)),
            );
          },
          separatorBuilder:(context, index) {
            return Divider(
              thickness: 50,
            );
          },
          itemCount: Data.one.length
      ),
    );
  }
}
