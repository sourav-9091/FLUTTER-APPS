import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hrms/screens/main_screen/nav_bar/Dashboard/profileUpdate.dart';
import 'package:hrms/screens/model/user.dart';
import 'package:hrms/screens/utils/user_preferences.dart';
import 'package:hrms/screens/widget/appbar_widget.dart';
import 'package:hrms/screens/widget/profile_widget.dart';
import 'package:hrms/screens/widget/textfield_widget.dart';

import 'Dashboard/linkUpdate.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // User user = UserPreferences.myUser;
  final name = TextEditingController();
  final email = TextEditingController();
  final facebook = TextEditingController();
  final twitter = TextEditingController();
  final instagram = TextEditingController();
  final youtube = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final _MyBox = Hive.box('data');
  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: buildAppBar(context),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              ProfileWidget(
                imagePath:
                    "http://${_MyBox.get("baseUrl")}:5000/images?username=${_MyBox.get("username")}&filename=pp",
                // onClicked: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //         builder: (context) => MaterialApp(
                //               home: EditProfilePage(),
                //               debugShowCheckedModeBanner: false,
                //             )),
                //   );
                // },
                onClicked: (() {}),
              ),
              SizedBox(
                height: 120,
              ),
              SizedBox(
                width: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => EditLinksPage())));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Update Links',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 165,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => EditProfileDetailPage())));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Update Profile',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ]),
      );
}
