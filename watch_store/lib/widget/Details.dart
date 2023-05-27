import 'package:flutter/material.dart';
import 'package:watch_store/model/dummy.dart';
import '../model/product.dart';

class Details extends StatefulWidget {
  late int id;
  Details({super.key, required this.id});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<Product> list = productList;
  late Product product;
  @override
  void initState() {
    super.initState();
    product = list[widget.id];
  }

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
            onPressed: () {
              Navigator.of(context).pushNamed("/checkout");
            },
            icon: const Icon(Icons.shopping_cart_checkout),
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 350,
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  product.desc,
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                child: Text(
                  "\$ ${product.price}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (product.quantity <= 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Quantity cannot be less than 0"),
                                  showCloseIcon: true,
                                  backgroundColor: Colors.black,
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                              return;
                            }
                            update(product.id, "remove");
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                          style: const ButtonStyle(
                            shadowColor: null,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${product.quantity}'),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (product.quantity >= 10) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Quantity cannot be greater than 10"),
                                  showCloseIcon: true,
                                  backgroundColor: Colors.black,
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                              return;
                            }
                            update(product.id, "add");
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          style: const ButtonStyle(
                            shadowColor: null,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                      width: 100,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/checkout");
                        },
                        child: const Text("Proceed to Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
