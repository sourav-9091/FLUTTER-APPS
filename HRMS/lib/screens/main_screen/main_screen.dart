import 'package:hive/hive.dart';
import 'package:hrms/logic/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/resetPassword2.dart';
import 'package:hrms/screens/main_screen/nav_bar/mainNav.dart';
import 'package:hrms/screens/main_screen/verifyPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mybox = Hive.box('data');
  final _MyBox = Hive.box('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Colors.green.shade50,
            backgroundImage: NetworkImage(
                "http://${_MyBox.get("baseUrl")}:5000/images?username=${_MyBox.get("username")}&filename=pp"),
          ),
        ),
        title: Text(
          "HRMS",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                EvaIcons.logOutOutline,
                color: Colors.black,
              ),
              onPressed: () {
                Future<bool> _onWillPop() async {
                  return (await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: new Text('Are You Sure ?'),
                          content: new Text('Want to logout from hrms ?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: new Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(
                                  LoggedOut(),
                                );
                              },
                              child: new Text('Yes'),
                            ),
                          ],
                        ),
                      )) ??
                      false;
                }

                _onWillPop();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 90,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: getWidget(),
          ),
        ),
      ),
    );
  }

  getWidget() {
    print("I AM CALLED BECAUSE TO CHECK");
    if (_MyBox.get("verifiedEmail").toString() == "false") {
      // return EmailVerify();
      print("**********I am inside if");
      return Register();
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: ((context) => (EmailVerify()))));
    // } else if (_MyBox.get("verifiedEmail").toString() == "true" &&
    //     _MyBox.get("pass_reset").toString() == "false") {
    //   return ForgetPasswordTwo();
    } else {
      print("****************I am inside else " +
          _MyBox.get("verifiedEmail").toString());
      // return Dashboard();
      return MyApp();
    }
  }
}

class Dashboard extends StatelessWidget {
  final _mybox = Hive.box('data');
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(),
      child: Column(children: [
        Text("Email :- ${_mybox.get("email")}"),
        SizedBox(height: 20),
        Text("Token :- ${_mybox.get("token")}"),
        SizedBox(height: 20),
        Text("isVerified :- ${_mybox.get("isVerified")}"),
      ]),
    );
  }
}
