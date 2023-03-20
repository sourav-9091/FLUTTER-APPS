import 'package:hrms/logic/login_bloc/login_bloc.dart';
import 'package:hrms/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/screens/auth/ipSettings.dart';
import 'package:hrms/style/theme.dart' as Style;

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;

  bool passwordVisible = false;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Forget Password?'),
            content: new Text('Check your mail for the new password'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: new Text('Ok'),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<bool> _onWillPop1() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: new Text('Know Your Developer'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  new Text('Your Lovable Unknown Club'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 121,
                    child: Image.asset(
                      "assets/meme.jpg",
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: new Text('Ok'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Login failed. Wrong Username/Password"),
              backgroundColor: Colors.red,
            ),
          );
          AlertDialog(
            title: new Text('Login Status'),
            content: new Text('Wrong Username Or Password! Try Again'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: new Text('Ok'),
              ),
            ],
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
            child: Form(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onDoubleTap: () {
                                  // _onWillPop1();
                                },
                                child: Image.asset(
                                  'assets/images/kiitLogo.png',
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                            emailValue: _usernameController.text,
                            passwordValue: _passwordController.text,
                          ),
                        );
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      onChanged: (value) {
                        BlocProvider.of<LoginBloc>(context).add(
                          LoginTextChangedEvent(
                            emailValue: _usernameController.text,
                            passwordValue: _passwordController.text,
                          ),
                        );
                      },
                      obscureText: passwordVisible ? false : true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: new InkWell(
                        child: new Text(
                          "Forget password?",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12.0),
                        ),
                        onTap: () {
                          print("I AM INSIDE FORGET PASSWORD");
                          _onWillPop();
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                            height: 45,
                            child: state is LoginLoading
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                            width: 25.0,
                                            child: CupertinoActivityIndicator(),
                                          )
                                        ],
                                      ))
                                    ],
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: _onLoginButtonPressed,
                                    child: Text("LOGIN",
                                        style: new TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Style.Colors.grey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Style.Colors.mainColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                              IconButton(
                                onPressed: (() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => IPSettings())));
                                }),
                                color: Colors.green,
                                icon: Icon(
                                  Icons.settings,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
