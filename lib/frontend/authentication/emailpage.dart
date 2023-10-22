import 'package:asco_online_tracking/frontend/authentication/verifypage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "emailpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: EmailPage(),
  ));
}

class EmailPage extends StatefulWidget {
  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String? eMailAdd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Password Reset"),
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
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        suffixStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        bool isEmailValid =
                            RegExp(r"^[A-Za-z0-9._%+-]+@asc\.com\.ph$")
                                .hasMatch(value!);
                        bool isTextEntered =
                            RegExp(r"^[A-Za-z]+$").hasMatch(value!);
                        if (value.isEmpty) {
                          return "Please enter email address!";
                        } else if (isTextEntered) {
                          return "Please enter a valid email address!";
                        } else if (!isEmailValid) {
                          return "Only exclusive email from asc is allowed!";
                        }
                      },
                      onChanged: (value) {
                        eMailAdd = '$value';
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formField.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please click the activation link we've sent to your number!",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              duration: Duration(
                                seconds: 2,
                              ),
                            ),
                          );
                          print(' $eMailAdd');
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => VerifyPage(),
                            ),
                            (route) => true,
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
}
