import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  String textContent = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('FormExample')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (v) {
                  this.textContent = v;
                  setState(() {});
                },
                onSubmitted: (v) {
                  print(v);
                },
                // onChanged: (v) {
                // textContent = v;
                // },
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent,
                    suffix: Icon(Icons.email),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'UserName'),
              ),
              Text(textContent)
            ],
          )),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';

  String password;

  bool isAccepted = false;

  sendForm() {
    if (isAccepted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          email: this.email,
          password: this.password,
        );
      }));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Warning'),
              content:
                  Text('you have to accept our conditions before sending data'),
              actions: [
                RaisedButton(
                    onPressed: () {
                      this.isAccepted = true;
                      setState(() {});
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage(
                          email: this.email,
                          password: this.password,
                        );
                      }));
                    },
                    child: Text('Accept')),
                RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancle')),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TextField(
              onChanged: (v) {
                this.email = v;
              },
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: TextField(
              obscureText: true,
              onChanged: (v) {
                this.password = v;
              },
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          CheckboxListTile(
              title: Text('Accept'),
              value: isAccepted,
              onChanged: (v) {
                this.isAccepted = v;
                setState(() {});
              }),
          RaisedButton(
              onPressed: () {
                sendForm();
              },
              child: Text('SEND'))
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  String email;
  String password;
  HomePage({
    this.email,
    this.password,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN DATA'),
      ),
      body: Column(
        children: [
          Text(this.email),
          Text(this.password),
        ],
      ),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class NewTask extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _NewTask();
// }

// class _NewTask extends State<StatefulWidget> {
//   bool accept = false;
//   String taskName;
//   String email;
//   String date;
//   TextEditingController controller = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   saveForm() {
//     bool isValidator = formKey.currentState.validate();
//     if (isValidator == true) {
//       formKey.currentState.save();
//     } else {
//       print('ERROR');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form App'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 onChanged: (value) {
//                   this.taskName = value;
//                 },
//                 controller: this.controller,
//                 validator: (value) {
//                   if (value.length == 0 || value == null) {
//                     return '* Required Field';
//                   }
//                 },
//                 onSaved: (v) {
//                   this.taskName;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Task Name',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               TextFormField(
//                 onChanged: (value) {
//                   this.email = value;
//                 },
//                 onTap: () async {
//                   DateTime taskDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2025));
//                   this.controller.text =
//                       '${taskDate.year}-${taskDate.month}-${taskDate.day}';
//                 },
//                 controller: this.controller,
//                 validator: (value) {
//                   if (value.length == 0 || value == null) {
//                     return '* Required Field';
//                   } //else if (!isEmail(value)) { return 'Incorrect Email Address';                  }
//                 },
//                 onSaved: (v) {
//                   this.date = v;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Task Date',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20)),
//                 ),
//               ),
//               CheckboxListTile(
//                   title: Text('Accept'),
//                   value: accept,
//                   onChanged: (v) {
//                     this.accept = v;
//                     setState(() {});
//                   }),
//               RaisedButton(
//                   child: Text('Send'),
//                   onPressed: () {
//                     saveForm();
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';

// // class NewForm extends StatefulWidget {
// //   @override
// //   _NewFormState createState() => _NewFormState();
// // }

// // class _NewFormState extends State<NewForm> {
// // String textContent='';
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
    
// //  return Scaffold(
// //       appBar: AppBar(
// //         title: Text('New Task'),
// //         ),
// //       body: Container(
// //         padding: EdgeInsets.all(20),
// //         child: Form(
// //           child: Column(
// //             children: [
// //               TextFormField(
// //   //               onChanged: (v),
// //   //               this.textContent=v;
// //   //               setState((){});
// //   // },
// //   decoration: const InputDecoration(
// //     icon: Icon(Icons.person),
// //     hintText: 'What do people call you?',
// //     labelText: 'Name *',
// //   ),
// //   onSaved: (String value) {
// //     // This optional block of code can be used to run
// //     // code when the user saves the form.
// //   },
  
// // )
// //     //            TextFormField(
                
// //     //             decoration: InputDecoration(
// //     //                 border: OutlineInputBorder(
// //     //                     borderRadius: BorderRadius.circular(20)),
// //     //                 labelText: 'new form'),
// //     //           ),
              
// //              ],
// //            ),
// //          ),
// //        ),
// //      );
// //   }
// // }