import 'package:flutter/material.dart';
import '../navigate.dart';
import '../models/Log.dart';

class AddPage extends StatelessWidget {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Log _log = new Log();

  FocusNode namefocus;
  
  @override
  Widget build(BuildContext context) {

    namefocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text('登録'),
      ),
      body: //new SingleChildScrollView(
       // child: 
        new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            //key: _formKey,
            autovalidate: true,
            child: FormUI(),
          ),
        ),
     // ),
      bottomNavigationBar: bottomNavigation(context),
    );
  }

 Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextField(
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Name'),
          onChanged: (text) {
              this._log.name = text;

              print(this._log);
          }
          //keyboardType: TextInputType.text,
            // validator: (value) {
            //   print(value);
            //   if (value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            // },
        ),
        /*
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          focusNode: namefocus,
          keyboardType: TextInputType.phone,
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        */
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: onSave,
          child: new Text('登録'),
        )
      ],
    );
  }

  void onSave() {

  }
}
