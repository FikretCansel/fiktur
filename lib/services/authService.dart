import 'dart:convert';

import 'package:fiktur/core/convert/resultConverter.dart';
import 'package:fiktur/models/auth_response.dart';
import 'package:fiktur/models/login.dart';
import 'package:fiktur/models/register.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService{

  Future<DataResult<AuthResponse>> login(Login login) async {

    print(login.email+login.password);

    final response = await http.post(
      Uri.parse('https://localhost:44335/api/Auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': login.email,
        'password':login.password
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));
      AuthResponse authResponse=new AuthResponse(token: "sss", expiration: DateTime.now(), firstName: 'yok', lastName: '', userId: 0,);
      if(result.data!=null){
        authResponse=AuthResponse.fromJson(result.data);
      }
      print("başarılı");
      return DataResult<AuthResponse>(success: result.success,message: result.message,data: authResponse);
    } else {

      print('Failed to create auth.');
      print(response.body);

      print(response.statusCode);

      return new DataResult<AuthResponse>(success: false,message: "Hata ile karşılaşıldı",data: AuthResponse(token: "sss", expiration: DateTime.now(), firstName: 'yok', lastName: '', userId: 0,));
    }
  }


  Future<AuthResponse> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://localhost:44335/api/Packages/getall'));

    print(response.statusCode);

    print(response.body);

    return new AuthResponse(token: "sss", expiration: DateTime.now(), firstName: 'yok', lastName: '', userId: 0,);
  }

  Future<DataResult<AuthResponse>> register(Register register) async {

    final response = await http.post(
      Uri.parse('https://localhost:44335/api/Auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': register.email,
        'password':register.password,
        'firstName':register.firstName,
        'lastName':register.lastName
      }),
    );
    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));
      AuthResponse authResponse=new AuthResponse(token: "sss", expiration: DateTime.now(), firstName: 'yok', lastName: '', userId: 0,);
      if(result.data!=null){
        authResponse=AuthResponse.fromJson(result.data);
      }
      print("başarılı");
      return DataResult<AuthResponse>(success: result.success,message: result.message,data: authResponse);
    } else {

      print('Failed to create auth.');
      print(response.body);

      print(response.statusCode);

      return new DataResult<AuthResponse>(success: false,message: "Hata ile karşılaşıldı",data: AuthResponse(token: "sss", expiration: DateTime.now(), firstName: 'yok', lastName: '', userId: 0,));
    }
  }

}