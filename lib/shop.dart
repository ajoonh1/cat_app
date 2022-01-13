import 'package:flutter/material.dart';
import 'package:cat_app/provider/counts.dart';
import 'package:provider/provider.dart';
import 'shopping.dart';

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);

  @override
  _shopState createState() => _shopState();
}

class _shopState extends State<shop> {
  bool inStock = true;
  var ownedItems;
  late DynamicList listClass;

  @override
  void initState() {
    super.initState();
    ownedItems = Provider.of<ListProvider>(context, listen: false);
    listClass = DynamicList(ownedItems.items);
  }

  Widget buildShoppingCard(shopping Shopping) {
    return Column(children: [
      Card(
        elevation: 2.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage(Shopping.imageUrl)),
            ],
          ),
        ),
      ),
      OutlinedButton(
          onPressed:
              Shopping.inStock == true && context.watch<Counts>().count >= 3600
                  ? () {
                      context.read<Counts>().remove(3600);
                      Shopping.inStock = false;
                      ownedItems.addItem(Shopping.num);
                    }
                  : () {
                      Shopping.inStock = true;
                    },
          child:
              ownedItems.contains(Shopping.num) ? Text('Owned') : Text('Buy'))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: shopping.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return buildShoppingCard(shopping.samples[index]);
          },
        ),
      ),
    );
  }
}
