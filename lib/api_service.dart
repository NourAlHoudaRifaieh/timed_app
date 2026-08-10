import 'package:http/http.dart' as http;
import 'dart:convert';
import 'list_view_modal.dart';

class ApiService {

  // final String baseUrl = "https://timedapp.com";
  final String baseUrl = "https://jsonplaceholder.typicode.com";
  static List <ListViewModal> localTodo = [];


  Future<bool> saveLogin(String username, String password) async{
    final Map<String,dynamic> loginData = {
      username: username,
      password: password,
    };
    final url = Uri.parse("$baseUrl/savelogin");
    try{
      final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json'
          },
          body: {'username': username, 'password': password},
      );
      return response.statusCode == 200 || response.statusCode == 201;
    }catch(e){
      return true;
    }
  }

  Future<List<ListViewModal>> getTodos() async{
    final url = Uri.parse("$baseUrl/todos");
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        final List <dynamic> todoJson = jsonDecode(response.body);;
        localTodo = todoJson.map((json) => ListViewModal.fromJson(json)).toList();
      }
    }catch(e){
      if( localTodo.isEmpty){
        localTodo =[
          ListViewModal(
              id: 1,
              title: 'Task 1',
              status: false,
              userId: 4,
          ),
          ListViewModal(
              id: 2,
              title: 'Task 2',
              status: false,
              userId: 1
          ),
          ListViewModal(
              id: 3,
              title: 'Task 3',
              status: true,
              userId: 3
          ),
          ListViewModal(
              id: 4,
              title: 'Task 4',
              status: true,
              userId: 2,
          ),
          ListViewModal(
              id:5,
              title: 'Task 5',
              status: false,
              userId: 6
          ),
        ];
      }
    }
    return localTodo;
  }

  Future <List<ListViewModal>> getTodosByTitle( String title) async{
    final url = Uri.parse("$baseUrl/getTodosByTitle?Title=$title");
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        final List<dynamic> decoded = json.decode(response.body);
        return decoded.map((json)=> ListViewModal.fromJson(json)).toList();
      }
    }catch(e){
    }
    return localTodo.where((todo) => todo.title.toLowerCase().contains(title.toLowerCase())).toList();
  }


}