import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps/screens/simple_maps.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Google Maps"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 15, 20, 25),
        child: Column(
          children: [
            Image.asset('images/logo.png'),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SimpleMaps();
                    }));
                  },child: const Text('Maps Undiksha'),)
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}