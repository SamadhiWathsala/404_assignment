import 'package:assignment/components/categories.dart';
import 'package:assignment/components/dashboard_hearder.dart';
import 'package:assignment/components/today_task_list.dart';
import 'package:assignment/services/fetch_todos.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.blueGrey[900],
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 5),
      //     child: CircleAvatar(
      //       backgroundImage: AssetImage('assets/images/profile.jpg'),
      //     ),
      //   ),
      //   title: SizedBox(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: const [
      //       Text('Hi',style: TextStyle(fontWeight: FontWeight.w300),),
      //       Text('Peter John ,',style: TextStyle(fontWeight: FontWeight.w600))
      //     ],),
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: (){},
      //         icon: Icon(Icons.more_vert,size: size.height/20,)
      //     )
      //   ],
      // ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardHeader(),
            Padding(
              padding: EdgeInsets.only(top: size.height/25,left: size.width/20,right: size.width/20),
              child: TextFormField(
                textAlign: TextAlign.start,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width/20, vertical: size.height/30),
              child: Text('Category',style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w400,color: Colors.white),),
            ),
            SizedBox(
              height: size.height/5,
                child: const Categories()
            ),
            SizedBox(height: size.height/20,),
            // Set this button for set today task list as a scrollable bottom sheet
            // const TaskViwButton(),
            const Expanded(
                child: TodayTaskList()
            )
          ],
        ),
      ),
      // bottomSheet: TodayTaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NetworkServices().fetchToDOs();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

