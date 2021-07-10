import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewTask();
}

class _NewTask extends State<StatefulWidget> {
  bool isComplete = false;
  String taskName;
  String email;
  String date;
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  saveForm() {
    bool isValidator = formKey.currentState.validate();
    if (isValidator == true) {
      formKey.currentState.save();
    } else {
      print('ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form App'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  this.taskName = value;
                },
                controller: this.controller,
                validator: (value) {
                  if (value.length == 0 || value == null) {
                    return '* Required Field';
                  }
                },
                onSaved: (v) {
                  this.taskName;
                },
                decoration: InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  this.email = value;
                },
                onTap: () async {
                  DateTime taskDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025));
                  this.controller.text =
                      '${taskDate.year}-${taskDate.month}-${taskDate.day}';
                },
                controller: this.controller,
                validator: (value) {
                  if (value.length == 0 || value == null) {
                    return '* Required Field';
                  } //else if (!isEmail(value)) { return 'Incorrect Email Address';                  }
                },
                onSaved: (v) {
                  this.date = v;
                },
                decoration: InputDecoration(
                  labelText: 'Task Date',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              CheckboxListTile(
                  title: Text('Is Complete'),
                  value: isComplete,
                  onChanged: (v) {
                    this.isComplete = v;
                    setState(() {});
                  }),
              RaisedButton(
                  child: Text('Send'),
                  onPressed: () {
                    saveForm();
                  })
            ],
          ),
        ),
      ),
    );
  }
}