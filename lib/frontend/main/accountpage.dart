import 'package:asco_online_tracking/frontend/authentication/authpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "accountpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: AccountPage(),
  ));
}

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formField = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();
  final prefixNumber = '+63';
  String? eMailAdd;
  String? phoneNumber;
  bool passToggle = true;
  bool cPassToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Account Settings"),
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
                    Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Daxxtropezz',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: userController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                      validator: (value) {
                        bool NumbersAndLetters =
                            RegExp(r"^[A-Za-z0-9]+$").hasMatch(value!);
                        if (value!.isEmpty) {
                          return "Please enter your username!";
                        } else if (!NumbersAndLetters) {
                          return "Please use numbers and letters only!";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
                          return "Please enter your email address!";
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
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_android),
                        prefixText: prefixNumber,
                        counterText: '',
                        prefixStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      validator: (value) {
                        // bool isPhoneValid =
                        //     RegExp(r"(^(?:[+0]9)?[0-9]{11,13}$)")
                        //         .hasMatch(value!);
                        if (value!.isEmpty) {
                          return "Please enter your mobile number!";
                        } else if (value.length < 10) {
                          return "Not an exclusive mobile number!";
                        }
                        // else if (!isPhoneValid) {
                        //   return "Please enter the correct Mobile number!";
                        // }
                      },
                      onChanged: (value) {
                        phoneNumber = '$prefixNumber$value';
                      },
                      maxLength: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
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
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password!";
                        } else if (passController.text.length < 6) {
                          return "Your password's length should be more than 6 characters!";
                        } else if (passController.value !=
                            cPassController.value) {
                          return "The password doesn't match!";
                        }
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: cPassController,
                      obscureText: cPassToggle,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              cPassToggle = !cPassToggle;
                            });
                          },
                          child: Icon(cPassToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password!";
                        } else if (cPassController.text.length < 6) {
                          return "Your password's length should be more than 6 characters!";
                        } else if (cPassController.value !=
                            passController.value) {
                          return "The password doesn't match!";
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formField.currentState!.validate()) {
                          print('object1');
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
                            'Edit',
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
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => AuthPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Logout',
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

  void onConfirm() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Registration Success!\nPlease click the activation link we've sent to your email!",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        duration: Duration(
          seconds: 2,
        ),
      ),
    );
    print('$phoneNumber $eMailAdd');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ),
      (route) => false,
    );
  }
}
