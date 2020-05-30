import 'package:flutter/material.dart';

import 'result.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController _controller = TextEditingController();
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Measure Temperature',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              text = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your city',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: RaisedButton.icon(
              onPressed: () {
                _controller.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(
                      url: text,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.search),
              label: Text('Search'),
              color: Colors.lime,
            ),
          )
        ],
      ),
    );
  }
}
