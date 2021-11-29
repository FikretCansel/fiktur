import 'package:fiktur/widgets/bezierContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomePage();
  }
}

class _HomePage extends State {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: pages(controller)
    );
  }
  Widget pages(PageController controller){
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: 200.0,
              height: 1000.0,
              child: Center(child: Text("Paket Seçme Sayfası",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),),
            ),
          ),
        ),
        Center(
          child: Text('Profil Sayfası'),
        ),
        Center(
          child: Text('Siparişlerimmm'),
        )
      ],
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}