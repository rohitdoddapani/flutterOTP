import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Thank You',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Your Details are Captured',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  )
                ],
              ),
            ),
//            Container(
//                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//                child: Column(
//                  children: <Widget>[
//                    TextField(
//                      keyboardType: TextInputType.phone,
//                      decoration: InputDecoration(
//                          labelText: 'PHONE NUMBER',
//                          labelStyle: TextStyle(
//                              fontFamily: 'Montserrat',
//                              fontWeight: FontWeight.bold,
//                              color: Colors.grey),
//                          focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(color: Colors.green))),
//                      controller: _phoneController,
//                    ),
//                    SizedBox(height: 60.0),
//                    Container(
//                      height: 40.0,
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Colors.greenAccent,
//                        color: Colors.green,
//                        elevation: 7.0,
//                        child: GestureDetector(
//                          onTap: () {
//                            final phone = _phoneController.text.trim();
//                            loginUser(phone, context);
//                          },
//                          child: Center(
//                            child: Text(
//                              'LOGIN',
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold,
//                                  fontFamily: 'Montserrat'),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//
//                  ],
//                )),

          ],
        ));
  }
}