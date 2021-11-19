import 'package:fiktur/models/results/result.dart';

class DataResult<T> extends Result{
  late T data;

  DataResult({String? message, required bool success,T? data}):super(success,message){
    this.data=data!;
  }

  // factory DataResult.fromJson(Map<String, dynamic> json,data) {
  //   return DataResult(message:json['message'],success:json['success'],data: data);
  // }


}