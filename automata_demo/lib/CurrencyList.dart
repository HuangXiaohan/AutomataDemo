import 'package:automata_demo/CurrencyCard.dart';
import 'package:flutter/material.dart';

class CurrencyList extends StatelessWidget {
  final dynamic item;

  const CurrencyList({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic infos = item["infos"];
    return Container(
      padding: EdgeInsets.all(20),
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item["type"]),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: infos.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CurrencyCard(info: infos[index]);
                }),
          ),
        ],
      ),
    );
  }
}
