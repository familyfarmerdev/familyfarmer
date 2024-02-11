import 'package:ecommers/utils/Loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ecommers/screens/auth/login/Details.dart';
import 'package:firebase_core/firebase_core.dart';
class CreateAccount extends StatefulWidget {
  //Firebase.initializeApp();
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false; // Add this line to manage loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),

                SizedBox(
                  height: 300,
                  width: 400,
                  child: Image.asset('assets/images/createaccount.png'),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _createAccount(context);
                    },
                    child: Text(
                      "next",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomLoading(isVisible: _isLoading), // Show loading widget based on _isLoading state
        ],
      ),
    );
  }

  void _createAccount(BuildContext context) async {
    setState(() {
      _isLoading = true; // Show loading widget before starting account creation
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // User account created successfully, you can navigate to the next screen or perform other actions.
      Fluttertoast.showToast(msg: "Successful account is created");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successful account is created'),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Details()),);
    } catch (e) {
      // Handle account creation errors
      print('Error creating user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating account: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false; // Hide loading widget after account creation process completes
      });
    }
  }
}
