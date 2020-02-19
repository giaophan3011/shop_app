import 'package:flutter/material.dart';

class ChooseOrganizationScreen extends StatelessWidget {
  final TextEditingController organizationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(
        'starting to build a screen where the user can input their organization name');

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your organization',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: organizationController,
              decoration: InputDecoration(
                //hintText: 'Enter your organization name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                print(organizationController.text);
              },
              child:  Container(
               
                width: double.infinity,
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
