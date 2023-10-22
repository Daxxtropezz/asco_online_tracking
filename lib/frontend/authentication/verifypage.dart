import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:asco_online_tracking/frontend/authentication/passwordpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "verifypage",
    theme: ThemeData(
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ),
    ),
    home: VerifyPage(),
  ));
}

class VerifyPage extends StatefulWidget {
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  bool _onVerify = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Password Reset"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Enter verification code',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            VerificationCode(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.red),
              keyboardType: TextInputType.number,
              underlineColor: Colors.redAccent,
              length: 4,
              cursorColor: Colors.red,
              margin: EdgeInsets.all(12),
              onCompleted: (String value) {
                setState(() {
                  _code = value;
                  if(_code == value) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => PasswordPage(),
                      ),
                          (route) => true,
                    );
                  }
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onVerify = value;
                });
                if (!_onVerify) FocusScope.of(context).unfocus();
              },
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: _onVerify
                    ? Text('Please enter verification code')
                    : Text('$_code')
              ),
            )
          ],
        ),
      ),
    );
  }
}
