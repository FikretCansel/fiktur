import 'PacketPropertyNew.dart';

class Packet{
  final int id;
  final String name;
  List<PacketPropertyNew> properties;
  final int price;
  Packet(this.id, this.name, this.properties,
      this.price);

  factory Packet.fromJson(Map<String,dynamic> json) {

    List<PacketPropertyNew> packetPropertiesList=[];
    for(var u in json['packageProperties']){
      PacketPropertyNew packetProperty=PacketPropertyNew(u['id'], u['description'], u['packageId']);
      packetPropertiesList.add(packetProperty);

    }

    return Packet(
      json['id'],
      json['detail'],
        packetPropertiesList,
      json['price']
    );
  }



}