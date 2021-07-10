import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applica/todoapp/data/dummy_data.dart';
import 'package:flutter_applica/todoapp/pages/all_tasks.dart';
import 'package:flutter_applica/todoapp/pages/complete_tasks.dart';
import 'package:flutter_applica/todoapp/pages/inComplete_tasks.dart';

import 'models/task_model.dart';

class TodoMainPage extends StatefulWidget {
  @override
  _TodoMainPageState createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  deletTask(Task task) async {
  Data.tasks.remove(task);
  setState(() {
    
  });  
  }
   updateTask(Task task) async {
  task.isComplete=!task.isComplete;
   int index= Data.tasks.indexOf(task);
   Data.tasks[index]=task;

  setState(() {
    
  });  
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () async {
            //       await Navigator.push(context,
            //           MaterialPageRoute(builder: (context) {
            //         // return NewTaskPage();
            //       }));
            //       // getAllTasks();
            //     },
            //   )
            // ],
            title: Text('Todo App'),
            bottom: TabBar(tabs: [
              Tab(
                child: Text('All Tasks'),
              ),
              Tab(
                child: Text('Complete Tasks'),
              ),
              Tab(
                child: Text('InComplete Tasks'),
              ),
            ]),
          ),
          body: TabBarView(children: [
            AllTasksPage(deletTask,updateTask),
            CompleteTasksPage(deletTask,updateTask),
            InCompleteTasksPage(deletTask,updateTask)
          ]),
        ));
  }
}