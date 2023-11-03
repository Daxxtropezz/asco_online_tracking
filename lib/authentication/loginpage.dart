import 'package:asco_online_tracking/authentication/emailpage.dart';
import 'package:asco_online_tracking/main/selectionpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "loginpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.login),
            SizedBox(width: 8),
            Text("Login to ASCo: Track"),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bg_main.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.8),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              child: Form(
                key: _formField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/asc_logo_orig.png',
                      width: 220,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        bool isEmailValid =
                            RegExp(r"^[A-Za-z0-9._%+-]+@asc\.com\.ph$")
                                .hasMatch(value!);
                        bool isTextEntered =
                            RegExp(r"^[A-Za-z]+$").hasMatch(value!);
                        // if (value.isEmpty) {
                        //   return "Please enter email address!";
                        // } else if (isTextEntered) {
                        //   return "Please enter a valid email address!";
                        // } else if (!isEmailValid) {
                        //   return "Only exclusive email from asc is allowed!";
                        // }
                        value.isEmpty
                            ? "Please enter your email address!"
                            : isTextEntered
                                ? "Please enter a valid email address"
                                : !isEmailValid
                                    ? "Only exclusive email from asc is allowed!"
                                    : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      controller: passController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(
                            passToggle
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        value!.isEmpty
                            ? "Please enter your password!"
                            : passController.text.length < 6
                                ? "Your password's length should be more than 6 characters!"
                                : null;
                      },
                      onFieldSubmitted: (value) {
                        loginValidation();
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        loginValidation();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmailPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loginValidation() {
    if (_formField.currentState!.validate()) {
      print("Login Success!");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SelectionPage(),
        ),
        (route) => false,
      );
    }
  }
}
