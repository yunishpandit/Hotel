import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 25),
        child: Container(
          child: ListView(
            children: [
              
                 Text("Settings",style: TextStyle(fontSize: 30),),
              
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.red,
                  ),
                   SizedBox(width: 10,),
                  Text("Account",style: TextStyle( fontSize: 20),)
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change password",style: TextStyle(fontSize: 20,color: Colors.grey),),
                  Icon(Icons.arrow_forward_outlined,
                  color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change langauge",style: TextStyle(fontSize: 20,color: Colors.grey),),
                  Icon(Icons.arrow_forward_outlined,
                  color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 10,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Privacy and Policy",style: TextStyle(fontSize: 20,color: Colors.grey),),
                  Icon(Icons.arrow_forward_outlined,
                  color: Colors.grey,
                  )
                ],
              ),
              SizedBox(height: 20,),
               Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.red,
                  ),
                   SizedBox(width: 10,),
                  Text("Notification",style: TextStyle( fontSize: 20),)
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("New update",style: TextStyle( fontSize: 20)),
                   CupertinoSwitch(value: true, onChanged: (bool val){})
                 ],
              ),
              SizedBox(height: 20,),
              Center(
                child: MaterialButton(
                  color: Colors.red,
                  
                  child: Text("Logout"),
                  onPressed: (){}),
              )
            ],
            
          ),
        ),
      ),
    );
  }
}