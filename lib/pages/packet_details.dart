import 'package:fiktur/models/tour_city.dart';
import 'package:fiktur/models/orderInfos.dart';
import 'package:fiktur/models/packet.dart';
import 'package:fiktur/widgets/packetConteiner.dart';
import 'package:flutter/material.dart';

class PacketDetails extends StatefulWidget {

  late Packet packet;
  PacketDetails(packet){
    this.packet=packet;
  }


  @override
  _PacketDetailsState createState() => _PacketDetailsState(packet);
}

class _PacketDetailsState extends State<PacketDetails> {
  late Packet packet;
  _PacketDetailsState(packet){
    this.packet=packet;
  }
  //OrderInfos orderInfos=OrderInfos.empty();
  TourCity selectedFromCity=TourCity(0, "Sehir");
  TourCity selectedToCity=TourCity(0, "Sehir");


  List<TourCity> fromCity=[
    TourCity(1,"Istanbul"),
    TourCity(2,"Ankara")
  ];
  List<TourCity> toCity=[
    TourCity(1,"Istanbul"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Packet Detayı Sayfası"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PacketContainer(packet),
            fromCityWidget(),
            toCityWidget(),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Payment2Page()
                  //   ),
                  //);
                },
                child: Text("Satın Al"))
          ],
          
        ),
      ),
    );
  }
  Widget fromCityWidget(){
    return Form(
      child: Column(
        children: [
          DropdownButton<TourCity>(
            focusColor:Colors.white,
            value: fromCity[0],
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor:Colors.black,
            items:
            fromCity
                .map<DropdownMenuItem<TourCity>>((TourCity value) {
              return DropdownMenuItem<TourCity>(
                value: value,
                child: Text(value.name,style:TextStyle(color:Colors.black),),
              );
            }).toList(),
            onChanged: (TourCity ?value){
              setState(() {
                fromCity[0].name=value!.name;
                toCity[0].id=value!.id;
              });
            },
            hint:Text(
              "Please choose your start location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget toCityWidget(){
    return Form(
      child: Column(
        children: [
          DropdownButton<TourCity>(
            focusColor:Colors.white,
            value: toCity[0],
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor:Colors.black,
            items:
            toCity
                .map((TourCity value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value.name,style:TextStyle(color:Colors.black),),
              );
            }).toList(),
            onChanged: (TourCity ?value){
              setState(() {
                selectedFromCity=value!;
              });
            },
            hint:Text(
              "Please choose your start location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

}

