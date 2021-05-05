import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final dynamic info;

  const CurrencyCard({Key key, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(int.parse(info["color"]))),
          ),
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              info["name"],
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          )),
          Flexible(child: Text(info["amount"])),
          Flexible(
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                    child: info["up"]
                        ? Icon(Icons.trending_up, color: Colors.green, size: 20)
                        : Icon(Icons.trending_down,
                            color: Colors.red, size: 20)),
                TextSpan(
                    text: info["percentage"],
                    style: TextStyle(
                        color: info["up"] ? Colors.green : Colors.red))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
