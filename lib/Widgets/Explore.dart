import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel/pages/hoteldetailes.dart';

class Explore extends StatefulWidget {
  const Explore({ Key? key }) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  navigatordetailes(DocumentSnapshot post){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedetailes(post: post)));
  }
  
 String _searchString = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
         
      if (_searchString.isEmpty)
            Center(
              child: Container(
                child: Text(
                  "Search Hotels",
                  style:TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                ),
              ),
            )
            else
            
       StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("Hotels").orderBy("name").startAt([_searchString]).endAt( ["$_searchString\uf8ff"]).snapshots(),
      builder: (_, snapshot){
        if(snapshot.hasError){
          return Text('Error = ${snapshot.error}');
          
        }
        if(snapshot.hasData){
          final docs=snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.only(
              top: 90,
            ),
            child: ListView.builder(
                itemCount: docs.length,
                itemBuilder:(_,i){
                  final data=docs[i].data();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: InkWell(
                      onTap: ()=>navigatordetailes(docs[i]),
                       child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black12,
                            )
                          ]
                        ),
                        child: Stack(children: [
                          Positioned(child: Container(
                            height: 130,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                              ),
                              image: DecorationImage(image: NetworkImage(data["image"]),
                              fit: BoxFit.cover
                              )
                            ),
                          )),
                          Positioned(
                            top: 15,
                            right: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(data["name"],style: TextStyle( fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text(data["location"],style: TextStyle(fontSize: 14,color: Colors.grey),),
                              SizedBox(height: 5,),
                              Text("${data["price"]}/night",style: TextStyle(fontSize: 16,color: Colors.blue),),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.directions_car,
                                      color: Colors.blue,

                                    ),
                                    SizedBox(width: 10,),
                                    Icon(
                                      Icons.hot_tub,
                                      color: Colors.blue,
                                      
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(
                                      Icons.local_bar,
                                      color: Colors.blue,
                                      
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(
                                      Icons.wifi,
                                      color: Colors.blue,
                                      
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                        ],),
                      ),
                    ),
                  );
                } ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    
            ),
    Padding(
            padding: const EdgeInsets.only(
              top: 45.0,
              left: 10
            ),
            child: Card(
              elevation: 13,
                          child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    _searchString = value;
                  });
                },
                decoration:InputDecoration(
                  icon: Icon( Icons.search),
                  border: InputBorder.none,
                  hintText: "Search here"
                ) ,
              ),
            ),
          ),
        ],
      )
    );
  }
}