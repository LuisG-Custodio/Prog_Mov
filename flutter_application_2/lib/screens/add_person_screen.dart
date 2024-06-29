import 'package:flutter/material.dart';
import 'package:expense_tracker/models/person.dart';
import 'package:expense_tracker/database/database.dart';

class AddPersonScreen extends StatefulWidget {
  final DatabaseProvider databaseProvider;

  const AddPersonScreen({Key? key, required this.databaseProvider})
      : super(key: key);

  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void _savePerson() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();

    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      Person person = Person(firstName: firstName, lastName: lastName);
      widget.databaseProvider.insertPerson(person);
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Person saved successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                firstNameController.clear();
                lastNameController.clear();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please enter both first name and last name.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _savePerson,
              child: Text('Save Person'),
            ),
          ],
        ),
      ),
    );
  }
}
