import 'dart:convert';

import 'package:complaint_management_app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../models/Complaint.dart';

class AddComplaintsScreen extends StatefulWidget {
  const AddComplaintsScreen({super.key});

  @override
  State<AddComplaintsScreen> createState() => _AddComplaintsScreenState();
}

class _AddComplaintsScreenState extends State<AddComplaintsScreen> {

  void _onSave() {
    final url = Uri.https(
        'complaint-management-app-a9416-default-rtdb.asia-southeast1.firebasedatabase.app',
        'complaint-list.json');
    http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'heading': _titleControler.text,
          'desc': _descriptionController.text,
          'category': _selectedCategory.name,
          'date': _selectedDate.toString(),
          'hostel': _selectedHostel.name,
        }));
  }

  final _titleControler = TextEditingController();

  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;

  Hostel _selectedHostel = Hostel.Hostel_A;

  Category _selectedCategory = Category.electricity;

  final formatter = DateFormat.yMd();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final datePicked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = datePicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: (AppBar(
        title: const Text('New Complaint'),
        backgroundColor: Theme.of(context).backgroundColor,
      )),
      body: Container(
        // color: Theme.of(context).accentColor,
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(8),
            topEnd: Radius.circular(8),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageInput(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: TextField(
                  controller: _titleControler,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    label: Text(
                      'Complaint heading.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(7),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: TextField(
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  controller: _descriptionController,
                  maxLength: 200,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    label: Text(
                      'Description in max 200 letters.',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              // const Spacer(),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 5, top: 10, bottom: 10),
                    child: Text(
                      'Category: ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  DropdownButton(
                    alignment: Alignment.topRight,
                    value: _selectedCategory,
                    items: Category.values
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e.name)))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      _selectedDate == null
                          ? 'No DateSelected'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                    ),
                    width: 120,
                    child: TextButton.icon(
                      onPressed: () => _onSave(),
                      icon: const Icon(
                        Icons.save,
                        color: Color.fromRGBO(219, 214, 238, 1),
                        size: 37,
                      ),
                      label: const Text('Save',
                          style: TextStyle(
                            color: Color.fromRGBO(219, 214, 238, 1),
                            fontSize: 18,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
