import 'package:complaint_management_app/screens/add_complaints_screen.dart';
import 'package:complaint_management_app/screens/pending_complaints_screen.dart';
import 'package:complaint_management_app/screens/profile_page.dart';
import 'package:flutter/material.dart';
import '../models/Complaint.dart';
import '../widgets/complaint_item.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<Complaint> complaints = [
    Complaint(
        text: 'Fan not working',
        description:
            "the motor in the fan hass burnt and is not making noises.",
        hostel: Hostel.Hostel_A,
        date: DateTime.now(),
        category: Category.electricity,
        tag: Tag.Done),
    Complaint(
      text: 'water Leak',
      description:
          "the entore washroom floor is covered in water and is overflowing. Please fix ASAP",
      hostel: Hostel.Hostel_B,
      date: DateTime.now(),
      category: Category.plumbing,
      tag: Tag.Pending,
    ),
    Complaint(
      text: 'Pitch Leak',
      description:
          "the entore washroom floor is covered in water and is overflowing. Please fix ASAP",
      hostel: Hostel.Hostel_B,
      date: DateTime.now(),
      category: Category.plumbing,
      tag: Tag.Pending,
    ),
  ];

  String selected_month = 'January';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
              radius: 25, backgroundColor: Color.fromARGB(255, 178, 158, 240)),
        ),
        title: const Text(
          'Hello John!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ProfilePage()));
              },
              iconSize: 35),
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: Row(
              children: [
                Text(
                  'OVERVIEW',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                //DROPBOX
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).accentColor,
                    ),
                    padding: const EdgeInsets.only(left: 16.0, right: 4),
                    child: DropdownButton<String>(
                      dropdownColor: Theme.of(context).accentColor,
                      value: selected_month,
                      onChanged: (String? newValue) {
                        setState(() {
                          selected_month = newValue!;
                        });
                      },
                      items:
                          months.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius:
                  BorderRadius.circular(8), // Adjust the radius value as needed
            ),
            height: 140,
            width: 340,
            child: Column(
              children: const [
                Text(
                  'Done',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 214, 238, 1),
                  ),
                ),
                Text(
                  'Pending',
                  style: TextStyle(
                    color: Color.fromRGBO(219, 214, 238, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 340,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => AddComplaintsScreen()));
                  },
                  child: Container(
                    width: 150,
                    height: 120,
                    decoration: BoxDecoration(
                      // boxShadow: [BoxShadow(color: Colors.black, ),],
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the radius value as needed
                    ),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).backgroundColor,
                      size: 50,
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                        8), // Adjust the radius value as needed
                  ),
                  child: TextButton(
                    child: Text(
                      'Pending',
                      style: TextStyle(
                          color: Theme.of(context).backgroundColor,
                          fontSize: 25),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => PendingComplaintsScreen(
                                  complaints: complaints)));
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 260),
            child: Text(
              'History',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
