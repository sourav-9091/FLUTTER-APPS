import 'package:flutter/material.dart';

import 'package:riverpotut/models/user.dart';
import 'package:riverpotut/pages/user_detail_page.dart';
import 'package:riverpotut/repositories/fetch_users.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    _fetchUsers();
    super.initState();
  }

  void _fetchUsers() async {
    try {
      setState(() {
        loading = true;
      });
      users = await fetchUsers();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error.isEmpty
              ? ListUsers(users: users)
              : buildError(),
    );
  }

  Widget buildError() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: _fetchUsers,
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListUsers extends StatelessWidget {
  final List<User> users;
  const ListUsers({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          return ListTile(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => userDetailsPage(user: user)))
            },
            leading: CircleAvatar(child: Text(user.id.toString())),
            title: Text(user.name),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: users.length);
  }
}
