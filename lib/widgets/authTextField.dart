import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget{
  String title="",dataField="";
  var validator;
  bool isPassword=false;
  AuthInput(String title, validator,String dataField, {bool isPassword = false}){
    this.title=title;
    this.validator=validator;
    this.dataField=dataField;
    this.isPassword=isPassword;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                validator: (value)=>validator(value),
                obscureText: isPassword,
                onSaved: (value){
                  dataField=value!;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color(0xfff3f3f4),
                    filled: true))
          ],
        ),
      );
    }
  }