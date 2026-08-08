import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex =0;
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
        title: Text('Main page '),
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
                 Text('Timed App', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold, color: Colors.white)),
               ],
              ),
            ),
            ListTile(
              selected:  _selectedIndex == 0,
              leading: Icon(Icons.timer, color: _selectedIndex == 0 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Timer',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 0 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =0;
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 1,
              leading: Icon(Icons.list, color: _selectedIndex == 1 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'List View',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 1 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =1;
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 2,
              leading: Icon(Icons.photo_size_select_actual_outlined, color: _selectedIndex == 2 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Gallery',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 2 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =2;
                });
              },
            ),
            ListTile(
              selected:  _selectedIndex == 3,
              leading: Icon(Icons.wifi, color: _selectedIndex == 3 ? Colors.indigo : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Network Service',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 3 ? Colors.indigo : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =3;
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
              selected:  _selectedIndex == 4,
              leading: Icon(Icons.logout, color: _selectedIndex == 4 ? Colors.redAccent : Colors.grey, size:22, fontWeight: FontWeight.bold),
              title: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize:20,
                      color: _selectedIndex == 4 ? Colors.redAccent : Colors.black)),
              onTap: (){
                setState(() {
                  _selectedIndex =4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}