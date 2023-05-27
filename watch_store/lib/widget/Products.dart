import 'package:flutter/material.dart';
import 'package:watch_store/model/dummy.dart';
import 'package:watch_store/widget/Card.dart';
import '../model/product.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Product> list = productList;
  @override
  Widget build(BuildContext context) {
    void update(id, type) {
      if (type == "add") {
        list[id].quantity++;
      } else {
        list[id].quantity--;
      }
      setState(() {
        list = list;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch Store"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout),
            onPressed: () {
              Navigator.of(context).pushNamed("/checkout");
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", ((route) => false));
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ...list.map((product) {
            return ProductCard(
              product: product,
              update: update,
            );
          })
        ],
      ),
    );
  }
}
