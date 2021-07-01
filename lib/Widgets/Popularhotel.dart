import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hotel/pages/hoteldetailes.dart';
class Popularhotel extends StatefulWidget {
  const Popularhotel({ Key? key }) : super(key: key);

  @override
  _PopularhotelState createState() => _PopularhotelState();
}

class _PopularhotelState extends State<Popularhotel> {
  navigatordetailes(DocumentSnapshot post){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedetailes(post: post)));
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection("Hotels").snapshots(),
      builder: (_, snapshot){
        if(snapshot.hasError){
          return Text('Error = ${snapshot.error}');
          
        }
        if(snapshot.hasData){
          final docs=snapshot.data!.docs;
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: docs.length,
            itemBuilder:(_,i){
              final data=docs[i].data();
            return InkWell(
              onTap: ()=>navigatordetailes(docs[i]),
                    child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 220,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0,
                      offset: Offset(0.0,4.0)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,
                      width: 170,
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(10),
                         topRight: Radius.circular(10),
                       ),
                       image: DecorationImage(image: NetworkImage(data["image"]),
                       fit: BoxFit.cover
                       )
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10,top: 10),
                    child: Text(data["name"],style: TextStyle(fontSize: 14),),
                    ),
                     Padding(padding: EdgeInsets.only(left: 10,),
                    child: Text(data["location"],style: TextStyle(fontSize: 14,color: Colors.grey),),
                    ),
                    Expanded(
                            child: Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                       Text("${data["price"]}/night",style: TextStyle(color: Colors.blue),),
                       Row(
                         children: [
                           Text("${data["star"]}",style: TextStyle(color: Colors.blue),),
                           Icon(Icons.star,color: Colors.blue,)
                         ],
                       )
                        ],
                      )
                      ),
                    )
                  ],
                ),
              ),
            );
          } );
        }
        return Center(child: CircularProgressIndicator());
      }
        
    
    );
  }
}