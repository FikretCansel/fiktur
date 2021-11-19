import 'package:fiktur/models/packet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PacketContainer extends StatelessWidget {
  // const PacketContainer({Key? key}) : super(key: key);
  late Packet packet;
  PacketContainer(packet){
    this.packet=packet;
  }


  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.antiAlias,
      color: Color.fromRGBO(227, 192, 104,1),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Özellikler',
              style:
                  TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.9)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(packet.properties.length,
                (index) => Text(packet.properties[index].description,style: TextStyle(fontSize: 20),)),
          ),
          SizedBox(height: 20,),
          Container(
            color: Color.fromRGBO(98, 185, 240, 1),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [Text(packet.name), Text(packet.price==0?"Bedava":packet.price.toString()+" TL")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
