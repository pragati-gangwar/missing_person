import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:missing_people/Custom/textItem.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'forgot_password.dart';
import 'HOME2.dart';
import '../services/global_method.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: _emailAddress.toLowerCase().trim(),
                password: _password.trim())
            .then((value) =>
                Navigator.canPop(context) ? Navigator.pop(context) : null);
      } catch (error) {
        _globalMethods.authErrorHandle(error.toString(), context);
        print('error occured ${error.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
    final user = await _auth.currentUser!;
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home2Page()));
    }
  }

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2A2550),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: const Color(0xFF251D3A),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'missing',
                        style: TextStyle(
                          color: const Color(0xFFE04D01),
                          letterSpacing: -1,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        'PERSON',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                SizedBox(height: 70),
                Image(
                  image: AssetImage('images/login_image.png'),
                  height: 250,
                  width: 300,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, right: 20.0, left: 20.0),
                          child: TextFormField(
                            key: ValueKey('email'),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.white,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                iconColor: const Color(0xFFE04D01),
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                labelText: 'Email Address',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _emailAddress = value!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, right: 20.0, left: 20.0),
                          child: TextFormField(
                            key: ValueKey('Password'),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 7) {
                                return 'Please enter a valid Password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _passwordFocusNode,
                            decoration: InputDecoration(
                                iconColor: const Color(0xFFE04D01),
                                border: const UnderlineInputBorder(),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color(0xFFE04D01)),
                            onSaved: (value) {
                              _password = value!;
                            },
                            obscureText: _obscureText,
                            cursorColor: Colors.white,
                            onEditingComplete: _submitForm,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              ForgotPassword()),
                                      (route) => false);
                                },
                                child: Text(
                                  'Forget password?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Material(
                            color: const Color(0xFFE04D01),
                            borderRadius:
                                BorderRadius.all(Radius.circular(14.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: _submitForm,
                              minWidth: 232.0,
                              height: 30.0,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
