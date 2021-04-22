import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/covid19.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _remeber = false;

  Widget _bulidEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open_Sans',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xff9a9a9a),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'Open_Sans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: 'Open_Sans')),
          ),
        ),
      ],
    );
  }

  Widget _bulidPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PassWord',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Open_Sans',
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xff9a9a9a),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'Open_Sans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your PassWord',
                hintStyle:
                    TextStyle(color: Colors.white, fontFamily: 'Open_Sans')),
          ),
        ),
      ],
    );
  }

  Widget _bulidForgotPassword() {
    return Expanded(
        child: Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () => print('ForgotPassword'),
              padding: EdgeInsets.only(right: 0.0),
              child: Text(
                'ForgotPassword',
                style: TextStyle(color: Colors.white, fontFamily: 'Open_Sans'),
              ),
            )));
  }

  Widget _bulidRemeberMe() {
    return Container(
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _remeber,
                checkColor: Colors.grey,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _remeber = value;
                  });
                },
              )),
          Text(
            'Remeber Me',
            style: TextStyle(color: Colors.white, fontFamily: 'Open_Sans'),
          )
        ],
      ),
    );
  }

  Widget _bulidLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Covid19App())),
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: Colors.white,
        child: Text('LOGIN',
            style: TextStyle(
                color: Color(0xff3f3f3f),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontFamily: 'Open_Sans',
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _bulidFacebook() {
    return GestureDetector(
      onTap: () => print('Login with Facebook'),
      child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
              image: DecorationImage(
                  image: AssetImage('assets/logo/facebook.png')))),
    );
  }

  Widget _bulidGoogle() {
    return GestureDetector(
      onTap: () => print('Login with Google'),
      child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black87,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
              image: DecorationImage(
                image: AssetImage('assets/logo/google.png'),
              ))),
    );
  }

  Widget _bulidSingUp() {
    return GestureDetector(
      onTap: () => print('Sing Up button Pressed'),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Don\'t have an Account?',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18.0)),
        TextSpan(
            text: 'Sing Up',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0))
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xff3f3f3f),
                      Color(0xff9a9a9a),
                      Color(0xff3f3f3f),
                    ])),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Covid19 App',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Open_Sans',
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _bulidEmail(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _bulidPassword(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Row(
                          children: [
                            _bulidRemeberMe(),
                            _bulidForgotPassword(),
                          ],
                        ),
                      ),
                      _bulidLogin(),
                      Column(
                        children: [
                          Text('- OR -',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              )),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Sing in whith',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Open_Sans',
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _bulidFacebook(),
                            _bulidGoogle(),
                          ],
                        ),
                      ),
                      _bulidSingUp(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
