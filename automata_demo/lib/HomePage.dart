import 'dart:convert';

import 'package:automata_demo/CurrencyList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('samples.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];

      print(_items);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text("Investments"),
            expandedHeight: 350,
            pinned: true,
            snap: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 220,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/home.jpg'),
                            fit: BoxFit.cover)),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "AKT Token",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w700),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Purchase our exclusive token with 25% bonus & get your lifetime Elite membership now",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 110,
                    child: ElevatedButton(
                        onPressed: () => {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Learn more"),
                            Expanded(child: Icon(Icons.arrow_forward))
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return CurrencyList(item: _items[index]);
          }, childCount: _items.length))
        ],
      ),
    );
  }
}
