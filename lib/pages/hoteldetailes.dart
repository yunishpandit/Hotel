import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Homedetailes extends StatefulWidget {
 
 final DocumentSnapshot post;

  const Homedetailes({Key? key, required this.post}) : super(key: key);
  @override
  _HomedetailesState createState() => _HomedetailesState();
}

class _HomedetailesState extends State<Homedetailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(widget.post["image"]),
            fit: BoxFit.cover
            )
          ),
          
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16,bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 200,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Text("${widget.post["name"]}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:Row(
                        children: [
                          Text("${widget.post["star"]}/45 reviews"),
                           Icon(Icons.star)
                        ],
                      )
                    ),
                    IconButton(onPressed: (){},
                    color: Colors.white,
                     icon: Icon(Icons.favorite_border))
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(32),
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      Expanded(
                               child: Text.rich(TextSpan(
                          children: [
                            WidgetSpan(child: Icon(Icons.location_on_outlined)),
                            TextSpan(
                              text: "${widget.post["location"]}"
                            )

                          ]
                        )),
                      ),
                      Column(
                        children: [
                           Text("${widget.post["price"]}",style: TextStyle(color: Colors.purple,fontSize: 25,),),
                           Text("/night")
                        ],
                      )
                      ],
                    ),
                  SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This room isn`t avialiable")));
                  },
                  child: Container(
                   height: 50,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: Colors.purple,
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Center(child: Text("Book now")),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Descreption:",style: TextStyle(fontSize: 20),),
                SizedBox(height: 5,),
                Text("${widget.post["dec"]}")

                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Details"),
          ))
      ],)
      
    );
  }
}