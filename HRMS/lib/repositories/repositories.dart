// // import 'dart:convert';

// // import 'package:dio/dio.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// // import 'package:hive/hive.dart';
// // import 'package:http/http.dart' as http;

// // class UserRepository {
// //   static String mainUrl = "http:/10.7.216.72";
// //   var loginUrl = '$mainUrl/index.php';

// //   final FlutterSecureStorage storage = new FlutterSecureStorage();
// //   final Dio _dio = Dio();

// //   Future<bool> hasToken() async {
// //     var value = await storage.read(key: 'token');
// //     if (value != null) {
// //       return true;
// //     } else {
// //       return false;
// //     }
// //   }

// //   Future<void> persistToken(String token) async {
// //     await storage.write(key: 'token', value: token);
// //   }

// //   Future<void> deleteToken() async {
// //     storage.delete(key: 'token');
// //     storage.deleteAll();
// //   }

// //   Future<String> login(String phone, String password) async {
// //     Map data = {"username": phone, "password": password};
// //     var body = json.encode(data);
// //     var response = await http.post(
// //         Uri.parse("http://10.7.213.171:5000/api/app/login"),
// //         headers: {"Content-Type": "application/json"},
// //         body: body);

// //     print("RESPONSE CODE IS i am :- ${response.statusCode.toString()}");

// //     if (response.statusCode == 200) {
// //       var jsondata = json.decode(response.body);
// //       final _MyBox = Hive.box('data');
// //       _MyBox.put("token", jsondata['token']);
// //       print("THE TOKEN IS :- ${_MyBox.get("token")}");

// //       if (response.statusCode == 200) {
// //         var response2 = await http.get(
// //             Uri.parse("http://10.7.213.171:5000/api/app/user/"),
// //             headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

// //         print("status code is of get user is :- ${response2.statusCode}");

// //         if (response2.statusCode == 200) {
// //           var jsondata2 = json.decode(response2.body);
// //           final _MyBox = Hive.box('data');

// //           print("VERIFICATION IS :- ${jsondata2['verified']}");

// //           _MyBox.put("email", jsondata2['email']);
// //           _MyBox.put("isVerified", jsondata2['verified']);
// //           _MyBox.put("department", jsondata2['department']);
// //           _MyBox.put("level", jsondata2['level']);
// //         }
// //         return jsondata['token'];
// //       } else {
// //         throw "SOMETHING WENT WRONG";
// //       }
// //     }

// //     return response.body;
// //   }

// //   Future<String> email(String email) async {
// //     var response =
// //         await http.post(Uri.parse("http://10.7.214.123:5000/app/verify"), body: {
// //       'email': email,
// //     });

// //     if (response.statusCode == 200) {
// //       var jsondata = json.decode(response.body);

// //       if (jsondata['status'] == "success") {
// //         return "success";
// //       } else {
// //         return "fail";
// //       }
// //     }
// //     return "fail";
// //   }
// // }

// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

// class UserRepository {
//   static String mainUrl = "http://10.7.216.72";
//   var loginUrl = '$mainUrl/index.php';

//   final FlutterSecureStorage storage = new FlutterSecureStorage();
//   final Dio _dio = Dio();

//   Future<bool> hasToken() async {
//     var value = await storage.read(key: 'token');
//     if (value != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> persistToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }

//   Future<void> deleteToken() async {
//     storage.delete(key: 'token');
//     storage.deleteAll();
//     print("Hey i am called");
//   }

//   Future<String> login(String phone, String password) async {
//     Map data = {"username": phone, "password": password};
//     var body = json.encode(data);
//     final _MyBox = Hive.box('data');
//     var response = await http.post(
//         Uri.parse("http://10.7.216.72:5000/api/app/login"),
//         headers: {"Content-Type": "application/json"},
//         body: body);

//     if (response.statusCode == 200) {
//       var jsondata = json.decode(response.body);
//       _MyBox.put("token", jsondata['token']);

//       var userResponse = await http.get(
//           Uri.parse("http://10.7.216.72:5000/api/app/user/"),
//           headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

//       if (userResponse.statusCode == 200) {
//         var jsonDataUser = json.decode(userResponse.body);
//         _MyBox.put("firstName", jsonDataUser['fname']);
//         _MyBox.put("lastName", jsonDataUser['lname']);
//         _MyBox.put('department', jsonDataUser['department']);
//         _MyBox.put('username', jsonDataUser['username']);
//         _MyBox.put('verifiedEmail', jsonDataUser['verified']);
//         _MyBox.put('level', jsonDataUser['level']);
//         _MyBox.put('email', jsonDataUser['email']);
//         _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
//         _MyBox.put('id', jsonDataUser['_id']);
//       }
//       print("Logged In Successfully");
//     } else if (response.statusCode == 401) {
//       var jsondata = json.decode(response.body);
//       final _MyBox = Hive.box('data');
//       _MyBox.put("loginStatus", "Wrong Username/Password");
//       print("Wrong Username");
//       throw HttpException('${response.statusCode}');
//     } else if (response.statusCode == 404) {
//       var jsondata = json.decode(response.body);
//       final _MyBox = Hive.box('data');
//       _MyBox.put("loginStatus", "Wrong Username/Password");
//       print("Wrong password");
//       throw HttpException('${response.statusCode}');
//     } else {
//       throw HttpException('${response.statusCode}');
//     }

//     return "false";
//   }

//   Future<String> email(String email) async {
//         final _MyBox = Hive.box('data');
//     var userResponse = await http.get(
//         Uri.parse("http://10.7.216.72:5000/api/app/user/"),
//         headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

//     if (userResponse.statusCode == 200) {
//       var jsondata = json.decode(userResponse.body);

//       if (jsondata['pass_reset'] == "true") {
//         return "success";
//       } else {
//         return "fail";
//       }
//     }
//     return "fail";
//   }
// }

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

// class UserRepository {
//   static String mainUrl = "http:/10.7.216.72";
//   var loginUrl = '$mainUrl/index.php';

//   final FlutterSecureStorage storage = new FlutterSecureStorage();
//   final Dio _dio = Dio();

//   Future<bool> hasToken() async {
//     var value = await storage.read(key: 'token');
//     if (value != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> persistToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }

//   Future<void> deleteToken() async {
//     storage.delete(key: 'token');
//     storage.deleteAll();
//   }

//   Future<String> login(String phone, String password) async {
//     Map data = {"username": phone, "password": password};
//     var body = json.encode(data);
//     var response = await http.post(
//         Uri.parse("http://10.7.213.171:5000/api/app/login"),
//         headers: {"Content-Type": "application/json"},
//         body: body);

//     print("RESPONSE CODE IS i am :- ${response.statusCode.toString()}");

//     if (response.statusCode == 200) {
//       var jsondata = json.decode(response.body);
//       final _MyBox = Hive.box('data');
//       _MyBox.put("token", jsondata['token']);
//       print("THE TOKEN IS :- ${_MyBox.get("token")}");

//       if (response.statusCode == 200) {
//         var response2 = await http.get(
//             Uri.parse("http://10.7.213.171:5000/api/app/user/"),
//             headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

//         print("status code is of get user is :- ${response2.statusCode}");

//         if (response2.statusCode == 200) {
//           var jsondata2 = json.decode(response2.body);
//           final _MyBox = Hive.box('data');

//           print("VERIFICATION IS :- ${jsondata2['verified']}");

//           _MyBox.put("email", jsondata2['email']);
//           _MyBox.put("isVerified", jsondata2['verified']);
//           _MyBox.put("department", jsondata2['department']);
//           _MyBox.put("level", jsondata2['level']);
//         }
//         return jsondata['token'];
//       } else {
//         throw "SOMETHING WENT WRONG";
//       }
//     }

//     return response.body;
//   }

//   Future<String> email(String email) async {
//     var response =
//         await http.post(Uri.parse("http://10.7.214.123:5000/app/verify"), body: {
//       'email': email,
//     });

//     if (response.statusCode == 200) {
//       var jsondata = json.decode(response.body);

//       if (jsondata['status'] == "success") {
//         return "success";
//       } else {
//         return "fail";
//       }
//     }
//     return "fail";
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final FlutterSecureStorage storage = new FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasToken() async {
    // print("I am inside hasToken");
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    // print("I persist key");
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    Map data = {"username": phone, "password": password};
    var body = json.encode(data);
    final _MyBox = Hive.box('data');
    var response = await http.post(
        Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/app/login"),
        headers: {"Content-Type": "application/json"},
        body: body);

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      _MyBox.put("token", jsondata['token']);

      var userResponse = await http.get(
          Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/app/user/"),
          headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

      if (userResponse.statusCode == 200) {
        print("I AM INSIDE STATUS CODE AREA");
        var jsonDataUser = json.decode(userResponse.body);
        _MyBox.put("firstName", jsonDataUser['fname']);
        _MyBox.put("lastName", jsonDataUser['lname']);
        _MyBox.put('department', jsonDataUser['department']);
        _MyBox.put('username', jsonDataUser['username']);
        _MyBox.put('verifiedEmail', jsonDataUser['verified']);
        _MyBox.put('level', jsonDataUser['level']);
        _MyBox.put('email', jsonDataUser['email']);
        _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
        _MyBox.put('mobile', jsonDataUser['mobile']);
        _MyBox.put('address', jsonDataUser['address']);
        _MyBox.put('pass_reset', jsonDataUser['pass_reset']);
        _MyBox.put('id', jsonDataUser['_id']);
      }
      print("Logged In Successfully");
    } else if (response.statusCode == 401) {
      var jsondata = json.decode(response.body);
      final _MyBox = Hive.box('data');
      _MyBox.put("loginStatus", "Wrong Username/Password");
      print("Wrong Username");
      throw HttpException('${response.statusCode}');
    } else if (response.statusCode == 404) {
      var jsondata = json.decode(response.body);
      final _MyBox = Hive.box('data');
      _MyBox.put("loginStatus", "Wrong Username/Password");
      print("Wrong password");
      throw HttpException('${response.statusCode}');
    } else {
      throw HttpException('${response.statusCode}');
    }

    return "false";
  }

  Future<String> email(String email) async {
    final _MyBox = Hive.box('data');
    var userResponse = await http.get(
        Uri.parse("http://${_MyBox.get("baseUrl")}:5000/api/app/user/"),
        headers: {'Authorization': 'Bearer ${_MyBox.get('token')}'});

    if (userResponse.statusCode == 200) {
      var jsondata = json.decode(userResponse.body);

      if (jsondata['pass_reset'] == "true") {
        return "success";
      } else {
        return "fail";
      }
    }
    return "fail";
  }
}
