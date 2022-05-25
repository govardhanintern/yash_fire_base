import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_fire_base/AuthenticationHelper.dart';
import 'package:yash_fire_base/LoginPage.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  bool obscure = true;

  TextEditingController email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController ConfirmPassword = new TextEditingController();

  bool emailVal = false;
  bool Passwordval = false;
  bool ConfirmPasswordval = false;

  String emailError = "";
  String Passworderror = "";
  String ConfirmPassworderror = "";

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initstate() {
    super.initState();
    emailVal = Passwordval = ConfirmPasswordval = false;

    emailError = Passworderror = ConfirmPassworderror = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up Page"),
        ),
        body: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "SignUp Page",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 10,
                    controller: email,
                    decoration: InputDecoration(
                        errorText: emailVal ? emailError : null,
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.phone),
                        labelText: "Mobile No",
                        hintText: "Mobile No"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: Password,
                    decoration: InputDecoration(
                        errorText: Passwordval ? Passworderror : null,
                        border: OutlineInputBorder(),
                        prefix: Icon(Icons.lock),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ConfirmPassword,
                    obscureText: obscure,
                    decoration: InputDecoration(
                        errorText:
                            ConfirmPasswordval ? ConfirmPassworderror : null,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                          icon: Icon(obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (validate() == 0) {
                          //_signup(email.text, Password.text);
                        }
                      },
                      child: Text("Sign In")),
                  SizedBox(
                    height: 20,
                  ),
                  /*Row(
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
        ));
  }

  Future<void> _signup(email, password) {
    AuthenticationHelper()
        .signUp(email: email, password: password)
        .then((result) {
      if (result == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('success')));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Loginpage()));
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
        emailError = "Enter Email";
      });
      cnt++;
    }
    if (validateEmail(email.text)) {
      setState(() {
        emailVal = true;
        emailError = "Enter Valid Email";
      });
      cnt++;
    } else {
      setState(() {
        emailVal = false;
        emailError = "";
      });
    }
    if (Password.text.isEmpty) {
      setState(() {
        Passwordval = true;
        Passworderror = "Enter Password";
      });
      cnt++;
    } else if (Password.text.length < 6) {
      setState(() {
        Passwordval = true;
        Passworderror = "Minimum 6 Char Required";
      });
      cnt++;
    } else {
      setState(() {
        Passwordval = false;
        Passworderror = "";
      });
    }
    if (ConfirmPassword.text.isEmpty) {
      setState(() {
        ConfirmPasswordval = true;
        ConfirmPassworderror = "Enter Password";
      });
      cnt++;
    } else if (ConfirmPassword.text != Password.text) {
      setState(() {
        ConfirmPasswordval = true;
        ConfirmPassworderror = "Password Don't Match";
      });
      cnt++;
    } else {
      ConfirmPasswordval = false;
      ConfirmPassworderror = "";
    }
    return cnt;
  }
}
