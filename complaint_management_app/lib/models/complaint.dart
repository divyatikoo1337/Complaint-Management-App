import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { electricity, plumbing, miscleneous }

enum Hostel { Hostel_A, Hostel_B, Hostel_C, Hostel_D }

enum Tag {Done, Pending}

class Complaint {
  Complaint(
      {
        required this.text,
        required this.description,
        required this.date,
        required this.category,
        required this.hostel,
        required this.tag,
      })
      : id = uuid.v4();

  final Category category;
  final String id;
  final String text;
  final String description;
  final DateTime date;
  final Hostel hostel;
  final Tag tag;
}
