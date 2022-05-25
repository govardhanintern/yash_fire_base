import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_fire_base/AuthenticationHelper.dart';

import 'SignUpPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool obscure = true;
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  bool emailVal = false;
  bool passVal = false;

  String emailError = "";
  String passError = "";

  @override
  void initstate() {
    super.initState();
    emailVal = passVal = false;
    emailError = passError = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                    errorText: emailVal ? emailError : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "Email"),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: pass,
                obscureText: obscure,
                decoration: InputDecoration(
                    errorText: passVal ? passError : null,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility),
                    ),
                    labelText: "Pass",
                    hintText: "Pass"),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    _login(email.text, pass.text);
                  },
                  child: Text("Login")),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signuppage()));
                },
                child: RichText(
                  text: TextSpan(text: "Don't Have An Ac?", children: [
                    TextSpan(
                        text: "Sign Up", style: TextStyle(color: Colors.red))
                  ]),
                ),
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "16.png",
                    height: 50,
                    width: 50,
                  ),
                  Image.asset(
                    "17.png",
                    height: 50,
                    width: 50,
                  ),
                  Image.asset(
                    "18.png",
                    height: 50,
                    width: 50,
                  ),
                ],
              )*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(email, password) {
    AuthenticationHelper()
        .signIn(email: email, password: password)
        .then((result) {
      if (result == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('success')));

        /*Navigator.push(
            context, MaterialPageRoute(builder: (context) => Signuppage()));*/
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
      }
    });
  }

  int validate() {
    int cnt = 0;
    if (email.text.isEmpty) {
      setState(() {
        emailVal = true;
        emailError = "enter email";
      });
      cnt++;
    } else {
      setState(() {
        emailVal = false;
        emailError = "";
      });
    }
    if (pass.text.isEmpty) {
      setState(() {
        passVal = true;
        passError = "Enter Pass";
      });
      cnt++;
    } else {
      setState(() {
        passVal = false;
        passError = "";
      });
    }

    return cnt;
  }
}
