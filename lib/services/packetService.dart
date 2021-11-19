import 'dart:convert';
import 'package:fiktur/core/convert/resultConverter.dart';
import 'package:fiktur/models/packet.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:http/http.dart' as http;

class PacketService{


  Future<DataResult<List<Packet>>> getAllPackets() async {
    final response = await http
        .get(Uri.parse('https://localhost:44335/api/Packages/getAllPackagePropertyDetails'));

    print(response.statusCode);


    if (response.statusCode == 200) {
      DataResult result= ResultConverter.dataResultFromJson(jsonDecode(response.body));

      List<Packet> packetList=[];



      if(result.data!=null){
        // for(var u in result.data){
        //   // Packet packet=Packet(u['id'], u['detail'], u['price']);
        //   Packet packet=Packet.fromJson(u);
        //   packetList.add(packet);
        // }
        Iterable list=result.data;
        packetList=list.map((packet) => Packet.fromJson(packet)).toList();
      }

      return DataResult<List<Packet>>(success: result.success,message: result.message,data:packetList);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}