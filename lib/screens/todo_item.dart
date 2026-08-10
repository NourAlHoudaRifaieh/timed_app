import 'package:flutter/material.dart';
import 'package:timed_app/list_view_modal.dart';

class TodoItem extends StatelessWidget {
  final ListViewModal todo;
  TodoItem({
    super.key,
    required this.todo,
  });
  // TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details",style: TextStyle(fontSize:25, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
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
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Task ID: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text(todo.id.toString(), style: TextStyle(fontSize:18),)
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Text("User Id: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text(todo.userId.toString(), style: TextStyle(fontSize:18),)
                    ],
                  ),
                  SizedBox(height:10),
                  Text("Title: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(todo.title, style: TextStyle(fontSize:18)),
                  SizedBox(height:10),
                  Row(
                    children: [
                      Text("Status: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text(todo.status ? 'Completed' : 'Uncompleted', style: TextStyle(fontSize:18,
                        color: todo.status ? Colors.green : Colors.red,
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
