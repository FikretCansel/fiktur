import 'dart:convert';
import 'package:fiktur/core/convert/resultConverter.dart';
import 'package:fiktur/models/packet.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:fiktur/models/tour_city.dart';
import 'package:http/http.dart' as http;

class CitiesService{


  Future<DataResult<List<TourCity>>> getAllFromCity() async {
    final response = await http
        .get(Uri.parse('https://localhost:44335/api/fromCities/getAll'));

    print(response.statusCode);


    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));

      List<TourCity> tourCityList=[];



      if(result.data!=null){
        // for(var u in result.data){
        //   // Packet packet=Packet(u['id'], u['detail'], u['price']);
        //   Packet packet=Packet.fromJson(u);
        //   packetList.add(packet);
        // }
        Iterable list=result.data;
        tourCityList=list.map((city) => TourCity.fromJson(city)).toList();
      }

      return DataResult<List<TourCity>>(success: result.success,message: result.message,data:tourCityList);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<DataResult<List<TourCity>>> getAllToCity() async {
    final response = await http
        .get(Uri.parse('https://localhost:44335/api/toCities/getAll'));

    print(response.statusCode);


    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));

      List<TourCity> tourCityList=[];



      if(result.data!=null){
        // for(var u in result.data){
        //   // Packet packet=Packet(u['id'], u['detail'], u['price']);
        //   Packet packet=Packet.fromJson(u);
        //   packetList.add(packet);
        // }
        Iterable list=result.data;
        tourCityList=list.map((city) => TourCity.fromJson(city)).toList();
      }

      return DataResult<List<TourCity>>(success: result.success,message: result.message,data:tourCityList);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}