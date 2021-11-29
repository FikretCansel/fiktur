import 'package:fiktur/models/TourOrder.dart';
import 'package:fiktur/models/tour_city.dart';
import 'package:fiktur/models/packet.dart';
import 'package:fiktur/services/TourOrderService.dart';
import 'package:fiktur/services/localDbService.dart';
import 'package:fiktur/widgets/packetConteiner.dart';
import 'package:flutter/material.dart';
import 'package:fiktur/services/citiesService.dart';

class PacketDetails extends StatefulWidget {

  late Packet packet;
  PacketDetails(packet){
    this.packet=packet;
  }


  @override
  _PacketDetailsState createState() => _PacketDetailsState(packet);
}
class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}

class _PacketDetailsState extends State<PacketDetails> {
  late Packet packet;
  _PacketDetailsState(packet){
    this.packet=packet;
  }

  String? toCitySelectedValue;
  String? fromCitySelectedValue;
  DateTime startDateSelectedValue=DateTime.now();
  DateTime finishDateSelectedValue=DateTime.now();
  List<TourCity> fromCity=[];
  List<TourCity> toCities=[];
  LocalDbService localDbService = LocalDbService();
  late TextEditingController descriptionTextController;
  late TextEditingController tourNameController;
  CitiesService citiesService=CitiesService();
  TourOrderService tourOrderService = TourOrderService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tourNameController = TextEditingController();
    descriptionTextController = TextEditingController();
    citiesService.getAllFromCity().then((value) =>{
      setState(() {
        fromCity=value.data;
      })
    }
    );
    citiesService.getAllToCity().then((value) =>{
      setState(() {
        toCities=value.data;
      })
    }
    );
  }


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
            fromCityDropDown(),
            toCityDropDown(),
            buildDatePickerFieldStart(),
            buildDatePickerFieldFinish(),
            descriptionTextField(),
            giveATourName(),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Payment2Page()
                  //   ),
                  // );
                  TourOrder tourOrder;
                  localDbService.getUserId().then((userId) => {
                    tourOrder= TourOrder(id: 1, fromCityId: 1, toCityId: 2,
                    startDate: startDateSelectedValue, finishDate: finishDateSelectedValue
                  ,userId:userId!,packetId: packet.id,
                    description: descriptionTextController.text, name: tourNameController.text),
                    print(userId),
                    tourOrderService.tourOrderAdd(tourOrder).then((value) => print(value.message))
                  });
                },
                child: Text("Satın Al"))
          ],
        ),
      ),
    );
  }
  Widget fromCityDropDown(){

    return DropdownButton<String>(
        value: fromCitySelectedValue,
        hint: Text(''),
    icon: const Icon(Icons.arrow_drop_down),
    onChanged: (String? newValue) {
    setState(() {
      fromCitySelectedValue = newValue!;
    });
    },
    items: <String>[...fromCity.map((e) => e.name)]
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList()
    );
  }
  Widget toCityDropDown(){
    return DropdownButton<String>(
        value: toCitySelectedValue,
        hint: Text(''),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            toCitySelectedValue = newValue!;
          });
        },
        items: <String>[...toCities.map((e) => e.name)]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList()
    );
  }

  Widget buildDatePickerFieldStart() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${startDateSelectedValue.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () => _selectDateStart(context),
            child: Text(
              'Tarih Seç',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
  Widget buildDatePickerFieldFinish() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${finishDateSelectedValue.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () => _selectDateFinish(context), // Refer step 3
            child: Text(
              'Tarih Seç',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }

  _selectDateStart(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDateSelectedValue, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != startDateSelectedValue)
      setState(() {
        startDateSelectedValue = picked;
      });
  }

  _selectDateFinish(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: finishDateSelectedValue, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != finishDateSelectedValue)
      setState(() {
        finishDateSelectedValue = picked;
      });
  }

  Widget descriptionTextField(){
   return TextField(
     controller: descriptionTextController,
     decoration: const InputDecoration(
         border: OutlineInputBorder(),
         hintText: 'Aklınızdaki Gezi planını yazınız'
     ),
   );
  }
  Widget giveATourName(){
    return TextField(
      controller: tourNameController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Gezinize bir isim vermek ister misin?'
      ),
    );
  }


}

