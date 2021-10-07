import 'package:contacts_01/data/local_contact.dart';
import 'package:contacts_01/model/contact.dart';
import 'package:flutter/material.dart';
class Recent extends StatefulWidget {


  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: buildContactsList(),
    );
  }
  Widget buildContactItem(Contact _contact) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_contact.image),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _contact.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_contact.mobileNumber),
                ],
              ),
            ),
            Text(_contact.date.toIso8601String().split('T').first),
            Expanded(
              child: Container(),
            ),
            if (_contact.isIncoming)
              Icon(
                Icons.arrow_downward,
                color: Colors.red,
              )
            else
              Icon(
                Icons.arrow_upward,
                color: Colors.green,
              )
          ],
        ),
      ),
    );
  }

  Widget buildContactsList() {
    return ListView.builder(
      itemBuilder: (_context, index) {
        return buildContactItem(contacts[index]);
      },
      itemCount: contacts.length,
    );
  }
}
