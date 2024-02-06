import 'package:flutter/material.dart';
import 'package:riverpotut/models/user.dart';

class userDetailsPage extends StatefulWidget {
  const userDetailsPage({super.key, required this.user});

  final User user;

  @override
  State<userDetailsPage> createState() => _userDetailsPageState();
}

class _userDetailsPageState extends State<userDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            child: Text(
              widget.user.id.toString(),
            ),
          ),
          title: Text(widget.user.username),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Text('Name : ${widget.user.name}'),
                Text('Email : ${widget.user.email}'),
                Text('Phone : ${widget.user.phone}'),
                Text('Website : ${widget.user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.brown[50],
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ShowAddress(address: widget.user.address),
          ),
          Container(
            color: Colors.amber[50],
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ShowCompany(company: widget.user.company),
          ),
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;
  const ShowAddress({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Adress',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('Street : ${address.city}'),
        Text('Suite : ${address.suite}'),
        Text('City : ${address.city}'),
        Text('Zip Code : ${address.zipcode}'),
        Row(
          children: [
            Text('Latitude : ${address.geo.lat}'),
            Text('Longitude : ${address.geo.lng}'),
          ],
        )
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;
  const ShowCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text('name : ${company.name}'),
        Text('Catch Phrase : ${company.catchPhrase}'),
        Text('Bs : ${company.bs}'),
      ],
    );
  }
}
