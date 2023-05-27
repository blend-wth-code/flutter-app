import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductCard extends StatefulWidget {
  Product product;
  Function update;
  ProductCard({super.key, required this.product, required this.update});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/details", arguments: widget.product.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.5,
        ),
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$ ${widget.product.price}',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 19,
                        ),
                      ),
                    ],
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
                            if (widget.product.quantity <= 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Quantity cannot be less than 10"),
                                  showCloseIcon: true,
                                  backgroundColor: Colors.black,
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                              return;
                            }
                            widget.update(widget.product.id, "remove");
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
                    Text('${widget.product.quantity}'),
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
                            if (widget.product.quantity >= 10) {
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
                            widget.update(widget.product.id, "add");
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
