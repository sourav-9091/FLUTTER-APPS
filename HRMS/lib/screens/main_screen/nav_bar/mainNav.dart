import 'package:flutter/material.dart';
import 'package:hrms/screens/main_screen/nav_bar/history.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/dashboard.dart';
import 'package:hrms/screens/main_screen/nav_bar/profile_page.dart';
import 'package:hrms/screens/main_screen/nav_bar/task_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _screen1 = HomeScreen();
  Widget _screen2 = DailyPage();
  Widget _screen3 = History();
  Widget _screen4 = ProfilePage();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: getBody(),
        bottomNavigationBar: MoonyNavigationBar(
          items: <NavigationBarItem>[
            NavigationBarItem(
                icon: Icons.home_rounded,
                activeIcon: Icons.home,
                color: Colors.blue,
                indicatorColor: Colors.blue,
                onTap: () {
                  onTapHandler(0);
                }),
            NavigationBarItem(
                icon: Icons.favorite_border_outlined,
                activeIcon: Icons.favorite,
                color: Colors.pink,
                indicatorColor: Colors.pink,
                onTap: () {
                  onTapHandler(1);
                }),
            NavigationBarItem(
                icon: Icons.history,
                activeIcon: Icons.history,
                color: Colors.black,
                indicatorColor: Colors.black,
                onTap: () {
                  onTapHandler(2);
                }),
            NavigationBarItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                color: Colors.green,
                indicatorColor: Colors.green,
                onTap: () {
                  onTapHandler(3);
                })
          ],
          style: MoonyNavStyle(
            activeColor: Theme.of(context).primaryColor,
            indicatorPosition: IndicatorPosition.TOP,
            indicatorType: IndicatorType.POINT,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._screen1;
    } else if (this.selectedIndex == 1) {
      return this._screen2;
    } else if (this.selectedIndex == 2) {
      return this._screen3;
    }
    return this._screen4;
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
