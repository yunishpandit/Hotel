import 'package:flutter/material.dart';
import 'package:hotel/Widgets/Hotelpackages.dart';
import 'package:hotel/Widgets/Popularhotel.dart';
class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        physics: BouncingScrollPhysics(),
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Find Your Havouriate Hotels",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: Colors.black,
                 image: DecorationImage(image: AssetImage("images/hotel.png"),
                 fit: BoxFit.cover
                 ),
                 boxShadow: [
                   BoxShadow(
                     blurRadius: 10,
                     color: Colors.black
                   )
                 ]
                ),
                
              )
               ],
             ),
             
           ),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: Card(
               elevation: 13,
                  child: TextFormField(
                    onTap: (){
                      
                    },
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: "Search Here",
                   icon: Icon(Icons.search)
                 ),
               ),
             ),
           ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20),
             child: Text("Popular Hotel:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
           ),
            SizedBox(height: 5,),
           Container(
             height: 250,
             width: double.infinity,
             child: Column(
               children: [
              Expanded(child: Popularhotel())
               ],
             ),
           ),
           SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("Hotel packges:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                 TextButton(onPressed: (){}, child: Text("View all")),
                 
              ],
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            child: Column(
                 children: [
                Expanded(child:Hotelpackages())
                 ],
               ),
          ),
           
         ],
        ),
      
    );
  }
}