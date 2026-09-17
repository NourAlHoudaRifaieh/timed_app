// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_app/api_service.dart';
import 'package:timed_app/widgets/custom_elevated_button.dart';
import 'package:timed_app/widgets/custom_form_field.dart';
import 'main_page.dart';
import 'package:intl/intl.dart';

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
  bool isChecked = false;
  final ApiService _apiService = ApiService();


  final Map<String, String> _predefinedUsers ={
    'user1': 'pass1',
    'user2': 'pass2'
  };
  @override
  void initState() {
    super.initState();
    _loadSavedUsername();
  }

  void _loadSavedUsername() async{
    final prefs = await SharedPreferences.getInstance();
    final rememberMe = prefs.getBool('remember_me') ?? false;
    if(rememberMe){
      final savedUsername = prefs.getString('saved_username');
      if(savedUsername != null){
        String loginTime = DateFormat('dd/MM/yyy HH:mm').format(DateTime.now());
        if(!mounted) return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context)=> MainPage(lastLogin: loginTime),)
        );
        return;
      }
    }

    final savedUsername = prefs.getString('saved_username');
    if(savedUsername != null){
      setState(() {
        _usernameController.text = savedUsername;
        isChecked = true;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            SizedBox(height:20),
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
                      child: CustomElevatedButton(
                          onPressed: ()async{
                            // DateTime loginTime = DateTime.now();
                            String loginTime = DateFormat('dd/MM/yyyy  HH:mm').format(DateTime.now());
                            if(_formKey.currentState!.validate()) {
                              final enteredUser = _usernameController.text
                                  .trim();
                              final enteredPass = _passwordController.text;
                              if (_predefinedUsers.containsKey(enteredUser) && _predefinedUsers[enteredUser] == enteredPass) {
                                // final success = await _apiService.saveLogin(
                                //   _usernameController.text.trim(),
                                //   _passwordController.text.trim(),
                                // );
                                final success = await _apiService.saveLogin(enteredUser, enteredPass);
                                if (!mounted) return;
                                if (success) {
                                  final prefs = await SharedPreferences.getInstance();
                                  await prefs.setBool('remember_me', isChecked);
                                  if(isChecked){
                                    await prefs.setString('saved_username', enteredUser);
                                  }else{
                                    await prefs.remove('saved_username');
                                  }
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(lastLogin: loginTime)),
                                  );
                                }else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(
                                          'Failed to save data, try again'))
                                  );
                                }
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid username or password')),
                              );
                            }
                          },
                          text: 'Login',
                          // style: ElevatedButton.styleFrom(
                          //   foregroundColor: Colors.white,
                          //   backgroundColor: Colors.indigo,
                          //   elevation: 5,
                          //   shadowColor: Colors.indigo,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15),
                          //   )
                          // ),
                          // child: Text('Login',
                          //   style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                          // ),
                      ),
                    ),
                    SizedBox(height:50),
                    SizedBox(
                      height: 200,
                      width:500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Predefined username and password to login',
                              style: TextStyle(fontSize:16,fontWeight: FontWeight.bold, color: Colors.indigo)
                          ),
                          SizedBox(height:10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('User 1:',
                                  style: TextStyle(fontSize:14, fontWeight:FontWeight.bold, color: Colors.indigo)
                              ),
                              SizedBox(width:7),
                              Text('user1 / pass1'),
                            ],
                          ),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('User 2:',
                                  style: TextStyle(fontSize:14, fontWeight:FontWeight.bold, color: Colors.indigo)
                              ),
                              SizedBox(width:7),
                              Text('user2 / pass2'),
                            ],
                          ),
                        ],
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