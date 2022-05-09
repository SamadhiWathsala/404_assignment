import 'dart:math';

import 'package:assignment/business_logic/todostatus.dart';
import 'package:assignment/models/todo.dart';
import 'package:assignment/services/fetch_todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayTaskList extends StatefulWidget {
  const TodayTaskList({Key? key}) : super(key: key);

  @override
  State<TodayTaskList> createState() => _TodayTaskListState();
}

class _TodayTaskListState extends State<TodayTaskList> {

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<ToDoStatusNotifier>(context, listen: true).fetchToDos();
    // create object of NetworkService
    // NetworkServices networkServices = NetworkServices();
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height/2.3,
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35)
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width/20,top: size.height/20),
            child: Text('Today task list',style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w500),),
          ),
          Expanded(
            child: FutureBuilder<List<ToDo>>(
              future: todoProvider,
                builder: (context,snapshots){
                  if(snapshots.hasData){
                    return ListView.builder(
                      itemCount: snapshots.data!.length,
                        itemBuilder: (context,index){
                         final todo = snapshots.data![index];
                          return  ListTile(
                            leading:  CircleAvatar(
                              backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              child: const Icon(Icons.child_friendly_outlined,color: Colors.white,),
                            ),
                            title: Text(todo.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                            subtitle: todo.status ? const Text('completed') : const Text('todo'),
                            // trailing: todo.status ?
                            // InkWell(
                            //     onTap: (){
                            //       Provider.of<ToDoStatusNotifier>(context, listen: false).updateStatus(todo.todoId);
                            //     },
                            //     child: Icon(Icons.star,color: Colors.green[400] )
                            // ) :
                            // InkWell(
                            //     onTap: (){
                            //       setState(() {
                            //         Provider.of<ToDoStatusNotifier>(context, listen: false).updateStatus(todo.todoId);
                            //       });
                            //     },
                            //     child: Icon(Icons.star_outline_outlined,color: Colors.grey[400] )
                            // ),

                            trailing: Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(Colors.green),
                              value: todo.status,
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  todo.status = !todo.status;
                                });
                              },
                            ),
                          );
                        }
                    );
                  }else if (snapshots.hasError) {
                    return Text('${snapshots.error}');
                  }
                  return const LinearProgressIndicator();
                }
            ),

            // >>>>>>>>>>>Represent the data by provider state management package
            //   child: ListView.builder(
            //     itemCount: Provider.of<ToDoStatusNotifier>(context, listen: false).todos.length,
            //       itemBuilder: (context,index){
            //       final todo = Provider.of<ToDoStatusNotifier>(context, listen: false).todos[index];
            //       print(todo);
            //       return  ListTile(
            //           leading:  CircleAvatar(
            //             backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            //             child: const Icon(Icons.child_friendly_outlined,color: Colors.white,),
            //           ),
            //           title: Text(todo.title,style: const TextStyle(fontWeight: FontWeight.w500),),
            //           subtitle: todo.status ? const Text('completed') : const Text('todo'),
            //           trailing: todo.status ?
            //           InkWell(
            //             onTap: (){
            //               Provider.of<ToDoStatusNotifier>(context, listen: false).updateStatus(todo.todoId);
            //             },
            //               child: Icon(Icons.star,color: Colors.green[400] )
            //           ) :
            //           InkWell(
            //             onTap: (){
            //               Provider.of<ToDoStatusNotifier>(context, listen: false).updateStatus(todo.todoId);
            //             },
            //               child: Icon(Icons.star_outline_outlined,color: Colors.grey[400] )
            //           ),
            //         );
            //       }
            //   ),


          )
        ],
      ),
    );
  }
}
