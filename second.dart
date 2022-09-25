import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget{
const SecondRoute ({Key? key}): super(key:key);
   Widget build(BuildContext context){
     return Scaffold(
        appBar: AppBar(
          title: Text("second"),
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: (){
              Navigator.of(context).pop();

            },
          ),
        ),
       body: Text("hello world"),
     );
   }
}
