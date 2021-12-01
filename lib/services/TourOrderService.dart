import 'dart:convert';

import 'package:fiktur/core/convert/resultConverter.dart';
import 'package:fiktur/models/TourOrder.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:fiktur/models/results/result.dart';
import 'package:http/http.dart' as http;


class TourOrderService{

  Future<Result> tourOrderAdd(TourOrder tourOrder) async {

    final response = await http.post(
      Uri.parse('https://localhost:44335/api/TourOrders/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "fromCityId": tourOrder.fromCityId,
        "toCityId": tourOrder.toCityId,
        "startDate": tourOrder.startDate.toIso8601String(),
        "finishDate": tourOrder.finishDate.toIso8601String(),
        "description": tourOrder.description,
        "name": tourOrder.name,
        "userId":tourOrder.userId,
        "packetId":tourOrder.packetId
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      Result result= ResultConverter.dataResultFromJson(jsonDecode(response.body));
      print("başarılı");
      return Result(result.success,result.message);
    } else {

      print('Hata var-TourOrder');
      print(response.body);

      print(response.statusCode);

      return new Result(false, "Hatayla Karşılaşıldı");
    }
  }
  Future<DataResult<List<TourOrder>>> getMyOrders(int userId) async {

    final response = await http
        .get(Uri.parse('https://localhost:44335/api/TourOrders/getByUserId?userId='+userId.toString()));

    print(response.statusCode);


    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));

      List<TourOrder> myTourOrderList=[];



      if(result.data!=null){
        // for(var u in result.data){
        //   // Packet packet=Packet(u['id'], u['detail'], u['price']);
        //   Packet packet=Packet.fromJson(u);
        //   packetList.add(packet);
        // }
        Iterable list=result.data;
        myTourOrderList=list.map((myTour) => TourOrder.fromJson(myTour)).toList();
      }
      print(myTourOrderList);

      return DataResult<List<TourOrder>>(success: result.success,message: result.message,data:myTourOrderList);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print("200 degil hata var");
      throw Exception('Failed to load album');
    }
  }



}