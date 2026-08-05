import 'package:flutter/material.dart';
import 'package:timed_app/widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
   bool  isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text('Welcome back',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)
            ),
            Text('Sign in to continue to your dashboard',
              style: TextStyle(fontSize: 14,color: Colors.grey.shade600)
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                        label: 'Username',
                        validator: (value)=>
                          value!.isEmpty ? 'Cannot be empty' : null,
                        prefixIcon: Icon(Icons.person_sharp),
                        controller: _usernameController,
                        hint: 'Enter username',
                        // obscureText: obscureText,
                        fillColor: Colors.grey.shade400,
                    ),
                    SizedBox(height:10),
                    CustomFormField(
                      label: 'Password',
                      validator: (value)=>
                      value!.isEmpty ? 'Cannot be empty' : null,
                      prefixIcon: Icon(Icons.lock),
                      controller: _passwordController,
                      hint: 'Enter Password',
                      obscureText: true,
                      fillColor: Colors.grey.shade400,
                    ),
                    SizedBox(height:10),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }
                        ),
                        Text('Remember Me',
                          style: TextStyle(fontSize:14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height:20),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            elevation: 5,
                            shadowColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                          ),
                          child: Text('Login',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                          ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}