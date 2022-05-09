import 'dart:convert';

import 'package:assignment/models/todo.dart';
import 'package:http/http.dart' as http;

class NetworkServices{

  //  fetch todos list
  Future<List<ToDo>> fetchToDOs() async{
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body);
      List<ToDo> todos = List<ToDo>.from(l.map((model)=> ToDo.fromJson(model)));
      print(todos);
      return todos;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load todos list');
    }
  }
}