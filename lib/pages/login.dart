import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [
              SizedBox(height: 50),

            //logo
            Icon(
              Icons.lock,
              size: 100,
              ),

            SizedBox(height: 25,)
            
            //welcome back, you've been missed!

            //login textfeild
          
            //password textfeild
          
            //forgot password?
          
            //sign in button
          
            //not a member? register now
          
          ],),
        ),
      )
    );
  }
}