import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

// screen import
import './signup.dart';
import './home.dart';
import '../shared/common_action_button.dart';
import '../../models/models.dart';

import '../providers/app_providers.dart';

class SigninScreen extends ConsumerWidget {
  static String id = "signin";

  final AuthenticationModel _credentials =
      AuthenticationModel(email: '', password: '');
  final _formKey = GlobalKey<FormState>();

// authentication method
  Future<void> loginUser(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      context.read(loadingChangeNotifer).setLoading(true);
      // close keypad and notiffies user
      FocusScope.of(context).requestFocus(new FocusNode());
      print({_credentials.email, _credentials.password});
      // fetech login service from provider
      final authService = context.read(authsProvider);
      final _profile = context.read(userprofileProvider).;
      // authenticating user into the system
      authService.userLogin(_credentials, context).catchError((err) {
        context.read(loadingChangeNotifer).setLoading(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Invalid login details!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
      }).then((res) {
        context.read(loadingChangeNotifer).setLoading(false);
        final bool hasUser = res.status;
        if (hasUser) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ));
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(res.message),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final loadingState = watch(loadingChangeNotifer);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: ModalProgressHUD(
        inAsyncCall: loadingState.loading,
        color: Colors.black,
        opacity: 0.4,
        child: Scaffold(
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
                                  fontSize: 32.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                              // color: Color(0xffffb6c1)),
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
                                    child: Text('Sign In to Wig Tools',
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
                                          // TODO: refactor_custom_label_text
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Username/Email',
                                              style:
                                                  textTheme.bodyText1.copyWith(
                                                      fontFamily: 'Notosan',
                                                      // fontSize: 12.0,
                                                      color: Color(0xffffffff)),
                                            ),
                                          ),
                                          // email input field
                                          TextFormField(
                                            onSaved: (e) =>
                                                _credentials.email = e,
                                            validator: (e) => !e
                                                        .contains('@') ||
                                                    e.isEmpty
                                                ? 'please enter a valid email'
                                                : null,

                                            // TODO: refactor input field decorations
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
                                          // password input filled
                                          TextFormField(
                                            onSaved: (e) =>
                                                _credentials.password = e,
                                            validator: (e) => e.isEmpty
                                                ? 'please provide a password!'
                                                : null,
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

                                          // Align(
                                          //   alignment: Alignment.centerRight,
                                          //   child: TextButton(
                                          //     onPressed: () {
                                          //       Navigator.of(context)
                                          //           .pushNamed(HomeScreen.id);
                                          //     },
                                          //     child: Text('Forgot password?',
                                          //         style: TextStyle(
                                          //             color:
                                          //                 Color(0xffffb6c1))),
                                          //     style: TextButton.styleFrom(
                                          //         backgroundColor:
                                          //             Colors.transparent),
                                          //   ),
                                          // ),
                                          SizedBox(height: 25.0),
                                          Align(
                                            alignment: Alignment.center,
                                            child: CommonActionButton(
                                              action: () {
                                                loginUser(context);
                                              },
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              txt: 'Sign In',
                                              btnColor: Color(0xffffb6c1),
                                              txtColor: Colors.white,
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
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(SignupScreen.id);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'No account?',
                                          style: textTheme.bodyText1.copyWith(
                                            fontSize: 14.0,
                                            color: Color(0xffffffff),
                                          )),
                                      TextSpan(
                                        text: ' Sign Up',
                                        style: textTheme.bodyText1.copyWith(
                                          color: Color(0xffFFB6C1),
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
