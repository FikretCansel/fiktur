import 'dart:convert';

import 'package:fiktur/models/album.dart';
import 'package:fiktur/models/login.dart';
import 'package:fiktur/services/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  void initState() {

    super.initState();

    // authService.fetchAlbum().then((value) => print("Çalıştı"));

    print("Siparişler Çalıştı");
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
          ElevatedButton(onPressed: (){}, child: Padding(padding: EdgeInsets.only(left: 40,right: 40),child: Text("Beni Tura Çıkart")))
      ],),
    );
  }
}
