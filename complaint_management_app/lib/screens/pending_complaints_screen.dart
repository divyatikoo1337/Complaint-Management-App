import 'package:complaint_management_app/screens/complaint_detail_screen.dart';
import 'package:complaint_management_app/widgets/complaint_item.dart';
import 'package:flutter/material.dart';

import '../models/Complaint.dart';

class PendingComplaintsScreen extends StatelessWidget {
  PendingComplaintsScreen({super.key, required this.complaints});

  final List<Complaint> complaints;

  @override
  Widget build(BuildContext context) {
    List<Complaint> pendingComplaints = complaints
        .where((complaint) => (complaint.tag == Tag.Pending))
        .toList();
    final number = pendingComplaints.length;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text('Pending Complaints'),
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: ListView.builder(
          itemCount: number,
          itemBuilder: ((context, index) => InkWell(
                child: ComplaintItem(complaint: pendingComplaints[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ComplaintDetailScreen(
                                complaint: pendingComplaints[index],
                              )));
                },
              )),
        ));
  }
}
