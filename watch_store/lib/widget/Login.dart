import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

  InputDecoration _decoration(String label) {
    return (InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    ));
  }
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: widget._decoration("Email"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,}$')
                      .hasMatch(value)) {
                    return "Invalid Email Address";
                  }
                  _email = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                decoration: widget._decoration("Password"),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 2) {
                    return "Password must be atleast 5 chars";
                  }
                  _password = value;
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).popAndPushNamed("/product");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login Successfull"),
                            ),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed("/register");
                    },
                    child: const Text("New user? Sign up here"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
