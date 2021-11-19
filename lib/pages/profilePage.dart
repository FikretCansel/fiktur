import 'package:fiktur/models/profile.dart';
import 'package:fiktur/pages/welcomePage.dart';
import 'package:fiktur/services/localDbService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Profile profile=Profile("", "", "");
  @override
  void initState() {
    super.initState();
    LocalDbService.getProfile().then((value) => {
      profile=value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            profile.firstName+""+profile.lastName,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("email :", style: TextStyle(fontSize: 25))),
              Text(profile.email, style: TextStyle(fontSize: 25)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("password :", style: TextStyle(fontSize: 25))),
              Text("*********", style: TextStyle(fontSize: 25))
            ],
          ),
          SizedBox(
            width: 200.0,
            height: 100.0,
            child: ElevatedButton(

              onPressed: () => logOut(),
              child: Text("Çıkış Yap"),
            ),
          )
        ],
      ),
    );
  }

  logOut() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage(title: '')),);
  }
}
