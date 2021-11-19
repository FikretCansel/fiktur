import 'package:fiktur/models/packet.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:fiktur/pages/packet_details.dart';
import 'package:fiktur/services/packetService.dart';
import 'package:fiktur/widgets/packetConteiner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PacketsPage extends StatefulWidget {
  const PacketsPage({Key? key}) : super(key: key);

  @override
  _PacketsPageState createState() => _PacketsPageState();
}

class _PacketsPageState extends State<PacketsPage> {

  PacketService packetService=PacketService();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Center(
    child: FutureBuilder<DataResult<List<Packet>>>(
    future: packetService.getAllPackets(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children:List.generate(snapshot.data!.data.length, (index) =>
          GestureDetector(child: PacketContainer(snapshot.data!.data[index])
            ,onTap: ()=>Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PacketDetails(snapshot.data!.data[index])),
              ))
              )
          );
        } else if (snapshot.hasError) {
          return Text('Bir Hata ile Karşılaşıldı');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ),
    ));
  }

}
