import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  InputDecoration _decoration(String label) {
    return (InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ));
  }

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  late String _firstName = '';
  late String _lastName = '';
  late String _email = '';
  late String _password = '';
  late String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Watch Store",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: (Column(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                "REGISTER",
                style: TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: widget._decoration("First Name"),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: widget._decoration("Last Name"),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: widget._decoration("Email"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,}$')
                          .hasMatch(value)) {
                        return "Invalid Email Address";
                      }
                      _email = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: widget._decoration("Password"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 2) {
                        return "Password must have atleast 5 chars";
                      }
                      _password = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: widget._decoration("Confirm Password"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password is required";
                      }
                      if (value.length < 2) {
                        return "Confirm Password must have atleast 5 chars";
                      }
                      if (value != _password) {
                        return "Confirm Password must match Password";
                      }
                      _confirmPassword = value;
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushNamed("/login");
                            }
                          },
                          child: const Text("Sign Up"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed("/login");
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
