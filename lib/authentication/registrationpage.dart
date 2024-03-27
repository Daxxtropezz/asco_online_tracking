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
  String validationButton = 'Submit';
  String? eMailAdd;
  String? phoneNumber;
  bool passToggle = true;
  bool cPassToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.red.shade700.withOpacity(0.9),
            ],
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.666,
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
              // Container(
              //   color: Colors.white.withOpacity(0.8),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/asc_tv_logo.png',
                      scale: 9.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ASCo: Track",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 31,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                top: 245,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(85),
                    ),
                    border: Border.all(
                      color: Colors.black.withOpacity(.8),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 45,
                        ),
                        child: Form(
                          key: _formField,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  // suffixIcon: InkWell(
                                  //   onTap: () {
                                  //     setState(() {
                                  //       passToggle = !passToggle;
                                  //     });
                                  //   },
                                  //   child: Icon(
                                  //     passToggle
                                  //         ? Icons.check_circle
                                  //         : Icons.close_rounded,
                                  //     color: Colors.red.shade700,
                                  //   ),
                                  // ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                                validator: (value) {
                                  bool isEmailValid = RegExp(
                                          r"^[A-Za-z0-9._%+-]+@asc\.com\.ph$")
                                      .hasMatch(value!);
                                  bool isTextEntered =
                                      RegExp(r"^[A-Za-z]+$").hasMatch(value);
                                  if (value.isEmpty) {
                                    return "Please enter email address!";
                                  } else if (isTextEntered) {
                                    return "Please enter a valid email address!";
                                  } else if (!isEmailValid) {
                                    return "Only exclusive email from asc is allowed!";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                controller: passController,
                                obscureText: passToggle,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.red.shade700,
                                  ),
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
                                      color: Colors.red.shade700,
                                    ),
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
                                  FocusScope.of(context)
                                      .requestFocus(passFocusNode);
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
                                  hintText: "Confirm Password",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.red.shade700,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        cPassToggle = !cPassToggle;
                                      });
                                    },
                                    child: Icon(
                                      cPassToggle
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.red.shade700,
                                    ),
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
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  regValidation();
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade700,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(.7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      validationButton,
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
                                      builder: (context) => LoginPage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(.7),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Return to Login',
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
                  ),
                ),
              ),
            ],
          ),
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
          "Registration Success!\nYou can login now!",
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
