import 'package:flutter/material.dart';
import 'package:myinstallerapp/provider/activites.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({Key? key}) : super(key: key);

  static const routeName = "/add-activity-screen";

  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _startDateFocusNode = FocusNode();
  final _endDateFocusNode = FocusNode();
  final _authorFocusNode = FocusNode();

  var isInt = true;
  var isLoaing = false;

  void _saveForm() {
    print("save action pressed");
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(2016, 8),
        lastDate: new DateTime(2110));
    if (picked != null && picked != selectedDate)
      setState(() => selectedDate = picked);
  }

  Map<String, String> _activityData = {
    'id': '',
    'title': '',
    'description': '',
    'startDate': '',
    'endDate': '',
    'author': '',
    'status': Status.Todo.toString(),
  };

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print(_activityData.values);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _startDateFocusNode.dispose();
    _endDateFocusNode.dispose();
    _authorFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Activity"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: "ActivityId"),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter id";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_titleFocusNode),
                onSaved: (value) {
                  _activityData['id'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.title),
                  labelText: "Title",
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter title";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocusNode),
                onSaved: (value) {
                  _activityData['title'] = value.toString();
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: "Description",
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Description";
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_startDateFocusNode),
                onSaved: (value) {
                  _activityData['description'] = value.toString();
                },
              ),
              InkWell(
                onTap: () {
                  _selectDate(); // Call Function that has showDatePicker()
                },
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Select Start Date',
                      icon: Icon(Icons.date_range),
                    ),
                    maxLength: 10,
                    focusNode: _startDateFocusNode,
                    onSaved: (value) {
                      _activityData['StartDate'] = value.toString();
                      print(_activityData['startDate']);
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _selectDate();
                },
                child: IgnorePointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.date_range_outlined),
                      hintText: 'Select End Date',
                    ),
                    maxLength: 10,
                    focusNode: _endDateFocusNode,
                    onSaved: (value) {
                      _activityData['endDate'] = value.toString();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
