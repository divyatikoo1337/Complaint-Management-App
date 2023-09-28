import 'package:complaint_management_app/models/Complaint.dart';
import 'package:flutter/material.dart';

class ComplaintDetailScreen extends StatelessWidget {
  ComplaintDetailScreen({super.key, required this.complaint});

  final Complaint complaint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Complaint's Detail"),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Complaint Heading: ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                complaint.text,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Complaint in detail: ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(complaint.description,
                      style: TextStyle(
                        fontSize: 17,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                height: 370,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).backgroundColor,
                      ),
                      label: Text(
                        "Delete",
                        style:
                            TextStyle(color: Theme.of(context).backgroundColor),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
