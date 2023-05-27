import 'package:flutter/material.dart';
import '../model/dummy.dart';
import '../model/product.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Product> list = productList;

  final _formKey = GlobalKey<FormState>();
  late String _firstName = '';
  late String _lastName = '';
  late String _address = '';
  late String _state = '';
  late String _city = '';
  late String _zipcode;
  late String _country = '';
  late String _cvv;

  InputDecoration _decoration(String label) {
    return (InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch Store"),
        actions: [
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: list.any((obj) => obj.quantity > 0)
                  ? Column(
                      children: [
                        ...list.map((obj) {
                          if (obj.quantity > 0) {
                            return ListTile(
                              contentPadding: const EdgeInsets.all(2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: SizedBox(
                                width: 70,
                                child: Image.asset(
                                  obj.image,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(obj.name),
                              trailing: SizedBox(
                                width: 100,
                                child: Text(
                                  "${obj.quantity} X ${obj.price.toStringAsFixed(2)} = \$${(obj.quantity * obj.price).toStringAsFixed(2)}",
                                ),
                              ),
                            );
                          }
                          return Container();
                        }).toList(),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            "Cart Value",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          trailing: Text(
                            '\$${list.map((product) => product.price * product.quantity).reduce((value, element) => value + element).toStringAsFixed(2)}',
                          ),
                        ),
                      ],
                    )
                  : const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("No Items in Cart"),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: _decoration("First Name"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "First Name is required";
                        } else if (value.length <= 2) {
                          return "First Name cannot be less than 2 chars";
                        } else if (!RegExp(r'^[a-zA-Z0-9 ]*$')
                            .hasMatch(_firstName)) {
                          return "First Name must be alphanumeric";
                        }
                        _firstName = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: _decoration("Last Name"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Last Name is required";
                        } else if (value.length <= 2) {
                          return "Last Name cannot be less than 2 chars";
                        } else if (!RegExp(r'^[a-zA-Z0-9 ]*$')
                            .hasMatch(_lastName)) {
                          return "Last Name must be alphanumeric";
                        }
                        _lastName = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: _decoration("Address"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Address is required";
                        }
                        _address = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: _decoration("City"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "City is required";
                        }
                        _city = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: _decoration("Province"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Province is required";
                        }
                        _state = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: _decoration("Zipcode"),
                      validator: (value) {
                        if (value == null || value.toString().trim().isEmpty) {
                          return "Zipcode is required";
                        }
                        if (value.toString().length != 5) {
                          return "Invalid Zipcode (#####)";
                        }
                        _zipcode = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: _decoration("Country"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Country is required";
                        }
                        _country = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: _decoration("Card Number"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "CVV is required";
                        }
                        if (value.toString().length != 16) {
                          return "Invalid Card Number format";
                        }
                        _cvv = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Validity",
                        hintText: "####",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Validity is required";
                        }
                        if (value.toString().length != 4) {
                          return "Invalid Validity format (####)";
                        }
                        _cvv = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: _decoration("CVV"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "CVV is required";
                        }
                        if (value.toString().length != 3) {
                          return "Invalid CVV format (###)";
                        }
                        _cvv = value;
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: list.any((obj) => obj.quantity > 0)
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Order Successful"),
                                  ),
                                );
                                Navigator.of(context)
                                    .popAndPushNamed("/products");
                              }
                            }
                          : null,
                      child: const Text("Checkout"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
