/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmMobile extends StatefulWidget {
  const ConfirmMobile({Key key}) : super(key: key);

  @override
  _ConfirmMobileState createState() => _ConfirmMobileState();
}

class _ConfirmMobileState extends State<ConfirmMobile> {
  TextEditingController mobile = new TextEditingController();
  bool mobile_validate;
  String mobile_error;

  @override
  void initState() {
    super.initState();
    mobile_error = "";
    mobile_validate = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Mobile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Confirm Your Mobile For New Signup",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            TextField(
              enableSuggestions: true,
              textInputAction: TextInputAction.next,
              controller: mobile,
              maxLines: 1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: mobile_validate ? mobile_error : null,
                  label: Text("Mobile")),
              maxLength: 10,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (validate() == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterOTP(
                                  mobile: mobile.text,
                                )));
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }

  int validate() {
    int cnt = 0;
    if (mobile.text.isEmpty) {
      setState(() {
        mobile_validate = true;
        mobile_error = "Enter Mobile";
      });
      cnt++;
    } else if (mobile.text.length < 10) {
      setState(() {
        mobile_validate = true;
        mobile_error = "Enter Valid Mobile";
      });
      cnt++;
    } else {
      mobile_validate = false;
      mobile_error = "";
    }
    return cnt;
  }
}
*/
