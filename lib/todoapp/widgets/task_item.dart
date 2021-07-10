import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applica/todoapp/models/task_model.dart';

class TaskItem extends StatelessWidget {
  Task task;
  Function updateFun;
  Function deletFun;
    TaskItem(this.task,{this.deletFun,this.updateFun});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
         margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         decoration: BoxDecoration(
             color: task.isComplete ? Colors.greenAccent : Colors.redAccent,
             borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading:IconButton(onPressed: () {
               this.deletFun(task);
              },
              icon: Icon(Icons.delete)) ,
           trailing: Checkbox(value: task.isComplete, onChanged: (value){
             this.updateFun(task);
           }),

                     title: Text(task.title),
        ),);

        
              // onPressed: () {
                // removing(task);
              // },
        //       icon: Icon(Icons.delete)),
        //   trailing: Checkbox(
        //       value: task.isComplete,
        //       onChanged: (v) {
        //         // updating(task);
        //       }),
        //   title: Text(task.title),
        // ));
  }
}