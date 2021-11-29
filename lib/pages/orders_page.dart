import 'dart:convert';

import 'package:fiktur/models/TourOrder.dart';
import 'package:fiktur/models/album.dart';
import 'package:fiktur/models/login.dart';
import 'package:fiktur/models/results/dataResult.dart';
import 'package:fiktur/services/TourOrderService.dart';
import 'package:fiktur/services/authService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage() : super();

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override

  TourOrderService tourOrderService = TourOrderService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: FutureBuilder<DataResult<List<TourOrder>>>(
        future: tourOrderService.getMyOrders(1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                  children: List.generate(
                      snapshot.data!.data.length,
                      (index) => Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(children: [
                            ListTile(
                              leading: Icon(Icons.arrow_drop_down_circle),
                              title: Text(snapshot.data!.data[index].name),
                              subtitle: Text(
                                snapshot.data!.data[index].toCityId.toString() +
                                    '-' +
                                    snapshot.data!.data[index].fromCityId
                                        .toString() +
                                    'Şehirleri Arasında',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                DateFormat.yMMMd().format(
                                        snapshot.data!.data[index].startDate) +
                                    '-' +
                                    DateFormat.yMMMd().format(
                                        snapshot.data!.data[index].finishDate) +'Tarihleri Arasında'+
                                    '\n Istek : ' +
                                    snapshot.data!.data[index].description,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            // ButtonBar(
                            //   alignment: MainAxisAlignment.start,
                            //   children: [
                            //     FlatButton(
                            //       onPressed: () {
                            //         // Perform some action
                            //       },
                            //       child: const Text('ACTION 1'),
                            //     ),
                            //     FlatButton(
                            //       onPressed: () {
                            //         // Perform some action
                            //       },
                            //       child: const Text('ACTION 2'),
                            //     ),
                            //   ],
                            // )
                          ])))),
            );
          } else if (snapshot.hasError) {
            return Text('Bir Hata ile Karşılaşıldı+snapshotdata problem');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    ));
  }
}
