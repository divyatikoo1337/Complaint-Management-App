import 'package:complaint_management_app/models/Complaint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplaintItem extends StatefulWidget {
  const ComplaintItem({super.key, required this.complaint});

  final Complaint complaint;

  @override
  State<ComplaintItem> createState() => _ComplaintItemState();
}

class _ComplaintItemState extends State<ComplaintItem> {
  final formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).accentColor,
        ),
        width: 340,
        height: 80,
        child: Row(
          children: [
            const CircleAvatar(
                radius: 28,
                backgroundColor: Color.fromARGB(255, 178, 158, 240)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    widget.complaint.text,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(widget.complaint.date.toString()),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text(widget.complaint.tag.toString().split('.').last),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
