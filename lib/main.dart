import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_shayari/Data.dart';

import 'list.dart';

void main()
{
  runApp(MaterialApp(home: Homepage(),debugShowCheckedModeBanner: false,));
}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 24),),actions: [
        Icon(Icons.share),
         Icon(Icons.more_vert)
      ], ),
      body: ListView.builder(
        itemCount: Data.title.length,
          itemBuilder:(context, index) {
            return Card(
              child:
              ListTile(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return list(index);
                },));
              },
                minLeadingWidth: 1000,
                leading:InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return img(index);
                  },));
                },
                    child: Image.asset(Data.main_image[index],)),
                title: Text(Data.title[index],style: TextStyle(color: Colors.green,fontSize: 24)),
              ),);
          },
      ),
    );
  }
}

class img extends StatefulWidget {
  int index;
  img(this.index);

  @override
  State<img> createState() => _imgState();
}

class _imgState extends State<img> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.green,title: Text(Data.title[widget.index],style: TextStyle(fontSize: 24),)),
      body: Container(height: double.infinity,width: double.infinity,child: Image.asset(Data.main_image[widget.index],fit: BoxFit.fill,),)
    );
  }
}

