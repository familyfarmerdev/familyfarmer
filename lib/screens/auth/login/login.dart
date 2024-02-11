import 'package:ecommers/screens/auth/login/LoginAccount.dart';
import 'package:flutter/material.dart';
import 'package:ecommers/screens/auth/login/CreateAccount.dart';
import 'package:ecommers/screens/auth/login/Details.dart';

class Login extends StatelessWidget {

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
      child :Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text("Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 26,

                fontWeight: FontWeight.bold
            ),

          ),
          SizedBox(height: 5,),
          Text("Login to enter the app",
            style: TextStyle(

              fontSize: 20,
            ),),
          SizedBox(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/welcome.png"),
          ),
          SizedBox(height: 50,),
          SizedBox(
            width: 300,
            height: 50,

            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccount()),
                );
              },

              child: Text("Sign Up",style: TextStyle(
                color: Colors.black
              ),),
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginAccount()),
                );

              },
              child: Text("Login",style: TextStyle(
                color: Colors.black
              ),),
            ),
          ),



        ],
      ),
    ),
    );

  }


}
