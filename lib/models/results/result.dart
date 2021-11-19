import 'iResult.dart';

class Result implements IResult{
  late bool success;
  late String? message;

  Result(bool success,String? message){
    this.success=success;
    this.message=message;
  }
}