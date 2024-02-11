import 'package:asco_online_tracking/authentication/authpage.dart';
import 'package:asco_online_tracking/authentication/loginpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "registrationpage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formField = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();
  final passFocusNode = FocusNode();
  final prefixNumber = '+63';
  String? eMailAdd;
  String? phoneNumber;
  bool passToggle = true;
  bool cPassToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Column(
      //     children: [
      //       Text(
      //         "ASCo: Track",
      //         style: TextStyle(fontSize: 21.0),
      //       ),
      //       Text(
      //         'Login',
      //         style: TextStyle(color: Colors.grey, fontSize: 17.0),
      //       )
      //     ],
      //   ),
      // ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bg_main.png',
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
                      SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/images/asc_tv_logo.png',
                        scale: 9.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "ASCo: Track",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 31,
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      Text(
                        'Register',
                        style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
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
                          if (value.isEmpty) {
                            return "Please enter your username!";
                          } else if (!NumbersAndLetters) {
                            return "Please use numbers and letters only!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
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
                              RegExp(r"^[A-Za-z]+$").hasMatch(value);
                          if (value.isEmpty) {
                            return "Please enter your email address!";
                          } else if (isTextEntered) {
                            return "Please enter a valid email address!";
                          } else if (!isEmailValid) {
                            return "Only exclusive email from asc is allowed!";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          eMailAdd = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          border: UnderlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android),
                          prefixText: "$prefixNumber ",
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
                          return null;
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
                        textInputAction: TextInputAction.next,
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
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(passFocusNode);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        focusNode: passFocusNode,
                        textInputAction: TextInputAction.done,
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
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          regValidation();
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          regValidation();
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
      ),
    );
  }

  void regValidation() async {
    if (_formField.currentState!.validate()) {
      final result = await showRegConf(context);
      if (result == true) {
        onConfirm();
      }
    }
  }

  Future<bool?> showRegConf(context) async {
    final value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ASCo Registration'),
            content: Text('are you sure that your credentials are correct?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.red),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.green),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: Icon(Icons.check),
              ),
            ],
          );
        });
    if (value != null) {
      return Future.value(value);
    } else {
      return Future.value(false);
    }
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
        builder: (context) => LoginPage(),
      ),
      (route) => false,
    );
  }
}
