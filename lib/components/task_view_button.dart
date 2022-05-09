import 'package:assignment/components/today_task_list.dart';
import 'package:flutter/material.dart';

class TaskViwButton extends StatelessWidget {
  const TaskViwButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width/1.5,
        child: ElevatedButton.icon(
            icon: const Icon(Icons.task_alt_outlined),
            onPressed: (){
              showBottomSheet(
                  context: context,
                  builder: (context) =>  TodayTaskList()
              );
            },
            label: const Text('View task list')),
      ),
    );
  }
}

