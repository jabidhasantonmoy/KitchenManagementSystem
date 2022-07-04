import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bazarlist.dart';
import '../widgets/bazar_item.dart' as Ci;
import '../providers/orders.dart';

class BazarlistScreen extends StatelessWidget {
  static const routeName = "/bazar-screen";
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bazar = Provider.of<Bazarlist>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bazar List",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.pink[50],
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "Tk ${bazar.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    backgroundColor: Colors.pink[50],
                  ),
                  TextButton(
                    child: const Text(
                      'Confirm List',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        bazar.items.values.toList(),
                        bazar.totalAmount,
                      );
                      bazar.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bazar.items.length,
              itemBuilder: (ctx, i) => Ci.BazarItem(
                bazar.items.values.toList()[i].id,
                bazar.items.keys.toList()[i],
                bazar.items.values.toList()[i].price,
                bazar.items.values.toList()[i].quantity,
                bazar.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.pink[50],
    );
  }
}
