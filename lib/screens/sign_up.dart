import 'package:demo_app/screens/dashboard.dart';
import 'package:demo_app/screens/login.dart';
import 'package:demo_app/services/auht_service.dart';
import 'package:demo_app/utils/appvalidator.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore: must_be_immutable
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignupviewState();
}

class _SignupviewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });
      var data = {
        "username": _userNameController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "password": _passwordController.text,
      };
      await authService.login(data, context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
      setState(() {
        isLoader = false;
      });
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 36, 42),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    "Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    controller: _userNameController,
                    style: TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Username", Icons.person),
                    validator: appValidator.validateUsername),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: _buildInputDecoration("Email", Icons.email),
                    validator: appValidator.validateEmail),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _phoneController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Phone Number", Icons.call),
                  validator: appValidator.validatePhoneNumber,
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: _buildInputDecoration("Password", Icons.lock),
                  validator: appValidator.validatePassword,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(209, 250, 138, 18)),
                        onPressed: () {
                          isLoader ? print("Loading") : _submitForm();
                        },
                        child: isLoader
                            ? Center(child: CircularProgressIndicator())
                            : Text("Create",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)))),
                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text("Login",
                        style: TextStyle(
                            color: Color.fromARGB(209, 250, 138, 18),
                            fontSize: 20)))
              ],
            ),
          ),
        ));
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
        fillColor: Color.fromARGB(170, 62, 63, 87),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x35949494))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFF949494)),
        labelText: label,
        suffixIcon: Icon(
          suffixIcon,
          color: Color.fromARGB(255, 232, 92, 92),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}
