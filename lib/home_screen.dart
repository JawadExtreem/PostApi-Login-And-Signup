import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

 void login(String email , password) async{

   try {
    Response response = await post (
      Uri.parse('https://reqres.in/api/register // or write login instead of register if you want to hit login api' ),
     body: {
        'email' : email,
         'password': password
     }
    );
    if(response.statusCode == 200){
      var data  = jsonDecode(response.body.toString());
      print(data['token']);
      print('account created successfully // or login successfully');
    }else{
      print('Failed to created account // failed to login');
    }
   }catch(e){
     print(e.toString());
   }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login and Signup')),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           TextFormField(
             controller: emailcontroller,
             decoration: InputDecoration(
               hintText: 'email',
             ),
           ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Sign Up // or login' ),),
            )

          ],
        ),
      ),
    );
  }
}
