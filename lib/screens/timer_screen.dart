import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {

  final String lastLogin;
  // TimerScreen({Key? key}) : super(key: key);
  TimerScreen({
    super.key,
    required this.lastLogin,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment:  Alignment.topRight,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width:1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('First Login', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
                    SizedBox(height:5),
                    Text('${widget.lastLogin.toString()}', style: TextStyle(fontSize:16)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:25),
          Container(),// here need to add the running timer in hh:mm:ss format
          SizedBox(height:25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width:1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, size:18 , color: Colors.indigo),
                          SizedBox(width:5),
                          Text('Total App Time', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('the total here..', style: TextStyle(fontSize:18)),
                    ],
                  ),
                ),
              ),
              SizedBox(width:10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width:1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.refresh_outlined, size:18 , color: Colors.indigo),
                          SizedBox(width:5),
                          Text('Current Session', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('the total here..', style: TextStyle(fontSize:18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
