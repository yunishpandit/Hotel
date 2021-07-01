
import 'package:flutter/material.dart';
class SigInpage extends StatefulWidget {
  const SigInpage({ Key? key }) : super(key: key);

  @override
  _SigInpageState createState() => _SigInpageState();
}

class _SigInpageState extends State<SigInpage> {
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 30,),
          Center(child: Text("Create a new Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
          SizedBox(height: 30,),
           Form(
             key: formkey,
             autovalidate: true,
              child: Column(
              children: [
                Container(
                  height: 180,
                  width: 300,
                  
                    child: Column(
                      children: [
                        Card(
                       child: TextFormField(    
                         
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                    hintText: "Enter your username",
                     labelText: "Email",
                    
                     ),
                    validator:  (val) {
                        if(val!.isEmpty){
                          return "Please enter email";
                        }else{
                          return null;
                        }
                      },
                     ),
                        ),
                        Card(
                       child: TextFormField( 
                         
                         obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                    hintText: "Enter your password",
                     labelText: "Password",
                  ),
                     validator:  (val) {
                        if(val!.isEmpty){
                          return "Please enter password";
                        }else{
                          return null;
                        }
                      },
                  ),
                        )
                      ],
                    ),
                  ),
              ],
          ),
           ),

          Column(
            children: [
            InkWell (
              onTap: () async{
              
              },
               child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red
                ),
                child: Center(child: Text("SignIn")),
              ),
            ),
            
            ],
          ),
        ],
      ),
      
    );
  }
}