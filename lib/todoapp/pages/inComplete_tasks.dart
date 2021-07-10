import 'package:flutter/cupertino.dart';
import 'package:flutter_applica/todoapp/data/dummy_data.dart';
import 'package:flutter_applica/todoapp/models/task_model.dart';
import 'package:flutter_applica/todoapp/widgets/task_item.dart';

class InCompleteTasksPage extends StatelessWidget{
  Function updateFun;
  Function deletFun;
    InCompleteTasksPage(this.deletFun,this.updateFun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return ListView.builder(
  itemCount: Data.tasks.where((element) => !element.isComplete).length,
            itemBuilder: (context, index) {
    return TaskItem (Data.tasks.where((element) => !element.isComplete).toList()[index],
    deletFun: deletFun,updateFun: updateFun,);
  });
  }

}