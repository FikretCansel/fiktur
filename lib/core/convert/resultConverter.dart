import 'package:fiktur/models/results/dataResult.dart';

class ResultConverter {
  static DataResult dataResultFromJson(Map<String, dynamic> json) {
    return DataResult(
        success: json['success'], message: json['message'], data: json['data']);
  }
}
