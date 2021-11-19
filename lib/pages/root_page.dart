import 'package:fiktur/pages/orders_page.dart';
import 'package:fiktur/pages/packets_page.dart';
import 'package:fiktur/pages/profilePage.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(controller),
      bottomNavigationBar: getFooter(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(69, 250, 47, 1),
      centerTitle: true,
      title: Text("FikTur" + pageIndex.toString()),

    );
  }

  Widget getBody(PageController controller) {
    List<Widget> pages = [ OrdersPage(),PacketsPage(), ProfilePage()];

    return PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: pages,
          onPageChanged: (page){
            setState(() {
              pageIndex=page;
            });
          },
        );
  }

  setPage(index) {
    setState(() {
      controller.jumpToPage(index);
    });
  }

  Widget getFooter() {
    List bottomItems = [
      Icon(Icons.home, size: 35),
      Icon(Icons.add_alert, size: 35),
      Icon(
        Icons.account_circle,
        size: 35,
      )
    ];

    return Container(
        height: 65,
        color: Color.fromRGBO(69, 250, 47, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomItems.length, (index) {
                return InkWell(
                  child: bottomItems[index],
                  onTap: () {
                    setPage(index);
                  },
                );
              })),
        ));
  }
}
