import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputController{
  TextEditingController name=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  InputController();
}

OutlineInputBorder enabledBorder=OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(
      color: Colors.black
  ),
);

OutlineInputBorder focusedBorder=OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(
      color: Color(0xff07FEC9),
  ),
);

class NameInput extends StatefulWidget {
  TextEditingController textEditingController=new TextEditingController();

  NameInput(this.textEditingController);

  @override
  _NameInputState createState() => _NameInputState();
}

class _NameInputState extends State<NameInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:30,left: 30,right: 30),
        child: TextField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            prefixIcon: Icon(
              FontAwesomeIcons.user,
              color: Colors.black,
            ),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }
}


class EmailInput extends StatefulWidget {
  TextEditingController textEditingController;

  EmailInput(this.textEditingController);

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:30,left: 30,right: 30),
        child: TextField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  TextEditingController textEditingController;

  PasswordInput(this.textEditingController);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isobscure=true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:30,left: 30,right: 30),
        child: TextField(
          controller: widget.textEditingController,
          obscureText: isobscure,
          cursorColor: Colors.black,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            prefixIcon: Icon(
              FontAwesomeIcons.key,
              color: Colors.black,
            ),
            suffixIcon: GestureDetector(
              onTap: ()=> setState(() {
                isobscure=!isobscure;
              }),
              child: Icon(
                isobscure?FontAwesomeIcons.eyeSlash:FontAwesomeIcons.eye,
                color: Colors.black,
              ),
            ),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatefulWidget {
  Function function;
  String string;
  SubmitButton(this.string,this.function);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: widget.function,
        padding: EdgeInsets.only(top:30),
        child: Container(
          height: 60,
          width: 144,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff00241c),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                widget.string,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HyperLink extends StatefulWidget {
  String string;
  Function function;

  HyperLink(this.string,this.function);

  @override
  _HyperLinkState createState() => _HyperLinkState();
}

class _HyperLinkState extends State<HyperLink> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Text(
        widget.string,
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 18,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class SigninAlternative extends StatefulWidget {
  String string;

  SigninAlternative(this.string);

  @override
  _SigninAlternativeState createState() => _SigninAlternativeState();
}

class _SigninAlternativeState extends State<SigninAlternative> {

  facebookSignin(){
    print("facebook vro");
  }

  googleSignin(){
    print("Google vro");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                ),
              ),
              Text(
                'OR',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                width: 150,
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                ),
              ),
            ],
          ),
        ),
        Text(
          'Sign '+widget.string+' using',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: facebookSignin,
                child: Container(
                  height: 50,width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff4267B2),
                  ),
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 25,),
              GestureDetector(
                onTap: googleSignin,
                child: Container(
                  height: 50,width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.redAccent,
                  ),
                  child: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}



