import 'package:asco_online_tracking/authentication/emailpage.dart';
import 'package:asco_online_tracking/authentication/registrationpage.dart';
import 'package:asco_online_tracking/main/homepage.dart';
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
  bool? isChecked = false;

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
                      'Login',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 20),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                top: 245,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(85)),
                    border: Border.all(
                      color: Colors.black.withOpacity(.8),
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 45),
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
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text,
                                controller: passController,
                                obscureText: passToggle,
                                decoration: InputDecoration(
                                  // labelText: "Password",
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
                                  }
                                  return null;
                                },
                                onFieldSubmitted: (value) {
                                  loginValidation();
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      tristate: false,
                                      activeColor: Colors.red.shade700,
                                      onChanged: (newRememberMe) {
                                        setState(() {
                                          isChecked = newRememberMe;
                                        });
                                      }),
                                  Text(
                                    'Keep me logged in',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () {
                                  loginValidation();
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
                                height: 18,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => RegistrationPage(),
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
                                      'Register Here',
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
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cannot get in?',
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
                                      'Regain Your Access Here!',
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loginValidation() {
    if (_formField.currentState!.validate()) {
      print("Login Success!");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
        (route) => false,
      );
    }
  }
}
