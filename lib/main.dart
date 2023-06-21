import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Love Shayari",style: TextStyle(fontSize: 36),),actions: [
        Icon(Icons.share),
         Icon(Icons.more_vert)
      ], ),
    );
  }
}
