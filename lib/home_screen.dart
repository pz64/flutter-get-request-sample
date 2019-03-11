import 'package:flutter/material.dart';
import 'my_http.dart';
import 'package:http_test/json_response.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {
@override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Http Test"),
      ),
      body: FutureBuilder<UserData>(
        future: getUserData(),
        builder: (context, snapshot)  {
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData ? Text(snapshot.data.age.toString()): Text("Null");
        },
      )
    );
  }
}