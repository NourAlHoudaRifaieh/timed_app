import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_app/login_screen.dart';
import 'package:timed_app/screens/gallery_screen.dart';
import 'package:timed_app/screens/list_view_screen.dart';
import 'package:timed_app/screens/network_service_screen.dart';
import 'package:timed_app/screens/timer_screen.dart';

class MainPage extends StatefulWidget {
  final String lastLogin;
  MainPage({
    super.key,
    required this.lastLogin,
  });
  // MainPage({Key? key, required  lastLogin}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex =0;
  String _headerTitle = 'Main Page';

  Widget _openPageBody(){
    switch(_selectedIndex){
      case 0:
        return Center(
          child: Text('Welcome to Main Page22', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        );
      case 1:
        return TimerScreen(lastLogin: widget.lastLogin);
      case 2:
        return ListViewScreen();
      case 3:
        return GalleryScreen();
      case 4:
        return NetworkServiceScreen();
      default:
        return Center(
          child: Text('Welcome to Main Page', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        );
    }
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _headerTitle,
            style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Builder(
            builder: (context){
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
              );
            }
        ),
      ),
      backgroundColor:  Colors.indigo.shade50,
      // body: _openPageBody(),
       body: Column(
         children: [
           Container(
              height:1,
              width:double.infinity,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width:1,
                    )
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                  ),
                ],
              ),
           ),
           Expanded(
               child: _openPageBody(),
           ),
         ],
       ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.indigo
              ),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 // Icon(Icons.person, color: Colors.white, size: 30),
                 // SizedBox(height:10),
                 Text(
                     'Timed App',
                     style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: Colors.white)),
               ],
              ),
            ),
            ListTile(
              selected:  _selectedIndex == 1,
              leading: Icon(Icons.timer, color: _selectedIndex == 1 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Timer',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 1 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =1;
                  _headerTitle =" Timer";
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => TimerScreen()),
                  // );
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 2,
              leading: Icon(Icons.list, color: _selectedIndex == 2 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'List View',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 2 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =2;
                  _headerTitle = "List View";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 3,
              leading: Icon(Icons.photo_size_select_actual_outlined, color: _selectedIndex == 3 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Gallery',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 3 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =3;
                  _headerTitle = "Gallery";
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 4,
              leading: Icon(Icons.wifi, color: _selectedIndex == 4 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Network Service',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 4 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =4;
                  _headerTitle = "Network Service";
                  Navigator.pop(context);
                });
              },
            ),
            // SizedBox(height:10),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width:1,
                  )
                ),
              ),
            ),
            ListTile(
              selected:  _selectedIndex == 5,
              leading: Icon(Icons.logout, color: _selectedIndex == 5 ? Colors.redAccent : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 5 ? Colors.redAccent : Colors.black)),
              onTap: () async{
                Navigator.pop(context);
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('remember_me', false);
                await prefs.remove('saved_username');

                if(!context.mounted) return;
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=> LoginScreen()),
                );
                // setState(() {
                //   _selectedIndex =5;
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}