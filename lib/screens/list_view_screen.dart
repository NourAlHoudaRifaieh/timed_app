import 'package:flutter/material.dart';
import 'package:timed_app/api_service.dart';
import 'package:timed_app/widgets/custom_form_field.dart';
import 'todo_item.dart';
import '../list_view_modal.dart';

class ListViewScreen extends StatefulWidget{
  ListViewScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewScreenState();
  }
  
}
class ListViewScreenState extends State<ListViewScreen>{
  final TextEditingController _searchController = TextEditingController();
  final ApiService _apiService = ApiService();
  List <ListViewModal> _displayTodos = [];
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    _loadTasks();
  }

  @override
  void dispose(){
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadTasks() async {
    setState(() {
      isLoading = true;
    });
    try {
      List <ListViewModal> data = await  _apiService.getTodos();
      setState(() {
        _displayTodos = data;
        isLoading = false;
      });
    }catch(e){
      setState(() {
        isLoading = false;
      });
    }
  }

  void _searchTodos(String title) async{
    if(title.trim().isNotEmpty){
      List<ListViewModal> data = await _apiService.getTodosByTitle(_searchController.text.trim());
      setState(() {
        _displayTodos = data;
      });
    }else{
      _loadTasks();
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CustomFormField(
              validator: (value) => value == null || value.isEmpty ? 'Cannot be empty' : null,
              prefixIcon: Icon(Icons.search),
              controller: _searchController,
              hint: 'Search tasks',
              fillColor: Colors.grey.shade400,
              label: 'Search',
              onChanged: _searchTodos,
          ),
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All the Todos", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        _searchController.clear();
                        _loadTasks();
                      },
                      icon: Icon(Icons.refresh, color: Colors.indigo)
                  ),
                  Text('Refresh', style: TextStyle(fontSize:16, color: Colors.indigo, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
          SizedBox(height:10),
          Expanded(
              child: ListView.builder(
                  itemCount: _displayTodos.length,
                  itemBuilder: (context, index){
                    final todo = _displayTodos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TodoItem(todo:todo),
                          ),
                        );
                      },
                      child: ListTile(
                          leading: Icon(
                            todo.status ? Icons.check_circle_outline : Icons.cancel_outlined,
                            color: todo.status ? Colors.green : Colors.red
                          ),
                          title: Text(todo.title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                          subtitle: Text(todo.status ? 'Completed' : 'Pending',
                            style: TextStyle(color: todo.status ? Colors.green : Colors.red),
                          ),
                        ),
                    );
                    // return ListTile(
                    //   leading: Icon(
                    //     todo.completed ? Icons.check_circle_outline : Icons.cancel_outlined,
                    //     color: todo.completed ? Colors.green : Colors.red
                    //   ),
                    //   title: Text(todo.title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    //   subtitle: Text(todo.completed ? 'Completed' : 'Pending',
                    //     style: TextStyle(color: todo.completed ? Colors.green : Colors.red),
                    //   ),
                    // );
                  }
              ),
          ),
        ],
      ),
    );
  }
  
}