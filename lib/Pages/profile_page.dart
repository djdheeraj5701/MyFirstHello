import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.greenAccent[700],
      ),
      backgroundColor: Color.fromRGBO(241, 242, 241, 1),
      body: Container(
        padding: EdgeInsets.only(top: 8),
        height: 700,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              CircleAvatar(
                backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/03/51/51/84/240_F_351518463_AeyMOj4PBTUmSipgx6ZicIZ3uHYgZqyZ.jpg'),
                radius: 65,
              ),
              SizedBox(height: 20,),
              Text(
                'Username',
                style: TextStyle(
                fontSize: 20
              ),),
              SizedBox(height: 20,),
              Text(
                'Email ID',
                style: TextStyle(
                    fontSize: 17
                ),),
              SizedBox(height: 50,),
              Card(
                //color: Colors.teal[50],
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                //padding: EdgeInsets.symmetric(horizontal: 20),
                // margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Divider(color: Colors.black, indent: 6, endIndent: 6,),
                    Row(
                      children: <Widget>[
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: (){},
                          padding: EdgeInsets.fromLTRB(20, 10, 182, 10),
                          child: Text('Change Password',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black, indent: 6, endIndent: 6,),
                    Row(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: (){},
                          padding: EdgeInsets.fromLTRB(20, 10, 193, 10),
                          //padding: EdgeInsets.fromLTRB(20, 10, 150, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text('Delivery Address',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black, indent: 6, endIndent: 6,),
                    Row(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: (){},
                          padding: EdgeInsets.fromLTRB(20, 10, 264, 10),
                          //padding: EdgeInsets.fromLTRB(20, 10, 150, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text('Payment',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.black, thickness: 2, indent: 6, endIndent: 6,),
                    Row(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                          onPressed: (){},
                          padding: EdgeInsets.fromLTRB(20, 10, 281, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text('Logout',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
