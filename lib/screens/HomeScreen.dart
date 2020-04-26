import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_otp_authentication/screens/FinalScreen.dart';
//import 'package:flutter_otp_authentication/Details.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class HomeScreen extends StatelessWidget {
  TextEditingController nameController = new TextEditingController();
  String name;
  String email;
  String address;
  String device;

  final db = Firestore.instance;

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  final FirebaseUser user;

//  final Details details;
//  HomeScreen({Key key,@required this.details,this.user}) : super(key: key);
  HomeScreen({this.user});

  _subscribetotop(top) async {
    _firebaseMessaging.subscribeToTopic(top).then((_) {
      print('subscribed');
    }).catchError((error) {
      print("error: $error");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      body: Container(
//        padding: EdgeInsets.all(32),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
//            SizedBox(height: 16,),
//            Text("${user.phoneNumber}", style: TextStyle(color: Colors.grey, ),),
//          ],
//        ),
//      ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                    child: Text('Enter Details',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold)),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(240.0, 0.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'NAME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),

                      onChanged: (val){
                        this.name = val;
                      },
                    ),
                    SizedBox(height: 60.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val){
                        this.email = val;
                      },
                    ),
                    SizedBox(height: 60.0),
                    TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          labelText: 'ADDRESS',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val){
                        this.address = val;
                      },
                    ),
                    SizedBox(height: 60.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Device ID',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      onChanged: (val){
                        this.device = val;
                      },
                    ),

                    SizedBox(height: 60.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () async {
                            //Insert into firebase
                            print(this.name);
                            print(this.email);
                            print(this.address);
                            if(this.name !=null && this.email!=null && this.address!=null) {
                              _subscribetotop(this.device);
                              await db.collection("Users").add(
                                  {
                                    'name': this.name,
                                    'email': this.email,
                                    'Address': this.address,
                                    'Phone': user.phoneNumber,
                                    'Device-id': this.device
                                  })
                                  .then((result) => print("success"))
                                  .catchError((err) => print(err));
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => FinalScreen()
                              ));
                            }else{
                              print("error null");
                            }
                          },
                          child: Center(
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )),

          ],
        ));
  }
}