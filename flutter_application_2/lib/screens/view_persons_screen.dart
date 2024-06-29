import 'package:flutter/material.dart';
import 'package:expense_tracker/database/database.dart';
import 'package:expense_tracker/models/person.dart';

class ViewPersonsScreen extends StatefulWidget {
  final DatabaseProvider databaseProvider;

  ViewPersonsScreen({Key key, this.databaseProvider}) : super(key: key);

  @override
  _ViewPersonsScreenState createState() => _ViewPersonsScreenState();
}

class _ViewPersonsScreenState extends State<ViewPersonsScreen> {
  List<Person> persons = [];

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  void _loadPersons() async {
    var loadedPersons = await widget.databaseProvider.getPersons();
    setState(() {
      persons = loadedPersons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Persons'),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title:
                Text('${persons[index].firstName} ${persons[index].lastName}'),
          );
        },
      ),
    );
  }
}
