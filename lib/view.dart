import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_shayari/Data.dart';
import 'package:love_shayari/edit.dart';

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
  List<Color> co = [Colors.pink, Colors.yellow];
  int R = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //co=Data.co.shuffle();
  }

  random() {
    do {
      R = Random().nextInt(5);
    } while (R == 0 || R == 1);
    co = Data.co;
    co.shuffle();
    co = co.sublist(0, R);
    return co;
  }

  Widget build(BuildContext context) {
    double size=(MediaQuery.of(context).size.height)-(MediaQuery.of(context).padding.top)-(kToolbarHeight)-10;
    int ind;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Love Shayari",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                            height: size,
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2
                                ),
                                itemCount: Data.co.length-1,
                                itemBuilder: (context, index) {
                                  return InkWell(onTap: () {
                                    Navigator.pop(context);
                                    co=[Data.co[index],Data.co[index+1]];
                                    setState(() {});
                                  },
                                    child: Container(margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(gradient: LinearGradient(colors: [Data.co[index],Data.co[index+1]])),
                                    ),
                                  );
                                },
                            ),
                            );
                          },
                      );
                    },
                     icon: Icon(Icons.palette,size: 50,)),
                Text("${widget.index + 1} / ${widget.a.length}",
                    style: TextStyle(fontSize: 24)),
                IconButton(
                    onPressed: () {
                      co = random();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.refresh_rounded,
                      size: 40,
                    )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:  co )),
                child: PageView.builder(
                  onPageChanged: (value) {
                    widget.index = value;
                    setState(() {});
                  },
                  controller: PageController(
                    initialPage: widget.index,
                  ),
                  itemCount: widget.a.length,
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(
                      widget.a[widget.index],
                      style: TextStyle(fontSize: 36),
                    ));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                height: 70,
                width: double.infinity,
                color: Colors.green,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                        onPressed: () {
                        },
                        icon: Icon(
                          Icons.copy,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {
                          widget.index > 0 ? widget.index-- : widget.index;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                              Text("${widget.a[widget.index]}");
                            var index;
                            return edit(index);

                          },));
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {
                          widget.index + 1 < widget.a.length
                              ? widget.index++
                              : widget.index;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.share,
                          size: 50,
                        )),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
          ],
        ));
  }
}
