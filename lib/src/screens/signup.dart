import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../shared/common_action_button.dart';

// screen import
import './screens.dart';
import '../../models/models.dart';
import '../providers/app_providers.dart';

class SignupScreen extends ConsumerWidget {
  static String id = "signup";

  final RegistrationModel _credentials =
      RegistrationModel(email: '', password: '');
  final RegistrationModel _confirm = RegistrationModel(email: '', password: '');
  final _formKey = GlobalKey<FormState>();

  Future<void> registerUser(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      // close keypad and notifies user
      formState.save();
      context.read(loadingChangeNotifer).setLoading(true);
      FocusScope.of(context).requestFocus(new FocusNode());

      final authService = context.read(authsProvider);

      authService.checkUser(_credentials.email).then((value) {
        if (value.status) {
          // register user if email is avaliable
          authService.userSignup(_credentials).catchError((onError) {
            context.read(loadingChangeNotifer).setLoading(false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(onError.toString()),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ));
          }).then((res) {
            context.read(loadingChangeNotifer).setLoading(false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Account Created Successfully!'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ));
            Navigator.of(context).pop(MaterialPageRoute(
              builder: (_) => SigninScreen(),
            ));
          });
        }
      }).catchError((error) {
        context.read(loadingChangeNotifer).setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email is already taken!'),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final loadingState = watch(loadingChangeNotifer);
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: ModalProgressHUD(
        inAsyncCall: loadingState.loading,
        color: Colors.black,
        opacity: 0.4,
        child: Scaffold(
          // resizeToAvoidBottomPadding: true,
          body: Container(
            constraints: BoxConstraints.tightFor(
                height: screen.height, width: screen.width),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.png"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black,
                    Color(0xffFFB6C1).withOpacity(0.4),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                ),
                Positioned(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(32.0),
                        // alignment: Alignment.center,
                        constraints: BoxConstraints.tightFor(
                            height: screen.height - 80.0, width: screen.width),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wig Tools',
                              style: textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32.0,
                                  color: Colors.white),
                            ),
                            // signin form
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text('Create a Wig Tools account',
                                        style: textTheme.headline4.copyWith(
                                            color: Color(0xffffffff),
                                            // fontWeight: FontWeight.l,
                                            fontSize: 24.0)),
                                  ),
                                  Divider(
                                    height: 12.0,
                                    color: Colors.white,
                                    indent: screen.width * 0.275,
                                    endIndent: screen.width * 0.275,
                                  ),
                                  Form(
                                    key: _formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Email',
                                              style:
                                                  textTheme.bodyText1.copyWith(
                                                      fontFamily: 'Notosan',
                                                      // fontSize: 12.0,
                                                      color: Color(0xffffffff)),
                                            ),
                                          ),
                                          TextFormField(
                                            onSaved: (e) =>
                                                _credentials.email = e,
                                            validator: (e) => !e
                                                        .contains('@') ||
                                                    e.isEmpty
                                                ? 'please enter a valid email'
                                                : null,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(12.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Color(0xffffb6c1),
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xffFFFFFF)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Password',
                                              style:
                                                  textTheme.bodyText1.copyWith(
                                                      fontFamily: 'Notosan',
                                                      // fontSize: 12.0,
                                                      color: Color(0xffffffff)),
                                            ),
                                          ),
                                          TextFormField(
                                            onChanged: (e) =>
                                                _credentials.password = e,
                                            onSaved: (e) =>
                                                _credentials.password = e,

                                            validator: (val) => val.isEmpty
                                                ? 'please provide a password!'
                                                : null,
                                            obscureText: true,
                                            // TODO: refactor inputdecoratorc
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(12.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Color(0xffffb6c1),
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xffFFFFFF)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Confirm Password',
                                              style:
                                                  textTheme.bodyText1.copyWith(
                                                      fontFamily: 'Notosan',
                                                      // fontSize: 12.0,
                                                      color: Color(0xffffffff)),
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          TextFormField(
                                            onSaved: (e) => _confirm.password,
                                            validator: (val) {
                                              var isValid =
                                                  val == _credentials.password
                                                      ? false
                                                      : true;
                                              return isValid || val.isEmpty
                                                  ? 'Password not mismatch'
                                                  : null;
                                            },
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.all(12.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Color(0xffffb6c1),
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                borderSide: BorderSide(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xffFFFFFF)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CommonActionButton(
                                txt: 'Signup',
                                txtColor: Color(0xffffb6c1),
                                btnColor: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                                action: () {
                                  registerUser(context);
                                },
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                // minWidth: double.infinity,
                                onPressed: () {
                                  Navigator.of(context)
                                      .popAndPushNamed(SigninScreen.id);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Already have an account?',
                                          style: textTheme.bodyText1.copyWith(
                                            fontSize: 14.0,
                                            color: Color(0xffffffff),
                                          )),
                                      TextSpan(
                                        text: ' Sign In',
                                        style: textTheme.bodyText1.copyWith(
                                          color: Color(0xffFFB6C1),
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
