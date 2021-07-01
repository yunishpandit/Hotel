import 'package:flutter/material.dart';
import 'package:hotel/pages/signuppage.dart';


class Loginpage extends StatefulWidget {
  const Loginpage({ Key? key }) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool istrue=true;
  GlobalKey<FormState> formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
         children: [
            Container(
              height: 250,
              width: 250,
            decoration: BoxDecoration(
               color: Colors.orange,
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                  
                  ),
                  Center(
                    child: Image.asset("images/hotel.png",height: 80,width: 80,),
                  ),
                 
              ],
            ),
            ),
             SizedBox(height: 30,),
                  Form(                  
                   child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                           children: [
                             TextFormField(
                               validator: (value) {
                                 if(value!.isEmpty){
                                 return "please enter your email";
                                 }else{
                                   return null;
                                 }
                               },
                           decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              hintText: "Email",
                              labelText: "Enter your email",
                              prefixIcon: Icon(Icons.mail),
                              
                           ),
                        ),
                        SizedBox(height: 10,),
                         TextFormField(
                           validator: (value) {
                             if(value!.isEmpty){
                               return "please enter your password";
                             }else{
                               return null;
                             }
                           },
                           obscureText: true,
                           decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              hintText: "Password",
                              labelText: "Enter your password",
                              prefixIcon: Icon(Icons.vpn_key),
                              fillColor: Colors.orange
                           ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            children: [
                              Text("Don`t have account?"),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SigInpage()));
                          }, child: Text("signUp"))
                            ],
                          ),
                        ),
                       
                        InkWell(
                           onTap: (){},
                             child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                               borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
                          ),
                        ),
                         Text("Or",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                           ],
                        )
                      ),
                    ),
                  ),
                 
                 Padding(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 40
                   ),
                   child: InkWell(
                     onTap: ()async{
                     
                     },
                      child: Container(
                       height: 60,
                       child: Card(
                         child: Row(
                           children: [
                             Image.asset("images/google1.png"),
                             Text("Continue with google")
                           ],
                         ),
                       ),
                     ),
                   ),
                 )
         ],
      ),
      
    );
  }
}