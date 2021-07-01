import 'package:flutter/material.dart';
import 'package:hotel/Widgets/Explore.dart';
import 'package:hotel/Widgets/Profile.dart';
import 'package:hotel/pages/homepage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({ Key? key }) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  var select=0;
  final List<Widget> children=[
    Homepage(),
    Explore(),
    Profile()

  ];
  void selectindex(int index){
    setState(() {
      select=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[select],
       bottomNavigationBar: BottomNavigationBar(
         selectedItemColor: Colors.red,
         currentIndex: select,
         onTap: selectindex,
         items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search),
        label: "Explore",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings),
        label: "Setting",
        )
      ],),
    );
  }
}