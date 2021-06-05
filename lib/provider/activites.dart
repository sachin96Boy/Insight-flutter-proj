import 'package:flutter/foundation.dart';

enum Status { Todo, inProgress, Done }

class Activities {
  final String id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String author;
  final Status status;




  const Activities({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.author,
    required this.status,
    
  });

}

