import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  final String url;
  Home({this.url});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var showData;
  bool isData = false;

  Future getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.url}&APPID=43ea6baaad7663dc17637e22ee6f78f2');
    var data = json.decode(response.body);
    var actualData = data['main']['temp'] - 273.15;
    print(actualData);
    setState(() {
      showData = actualData;
      isData = showData > 22.0 ? true : false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // bool isData = showData>22.0?true:false;

    return Scaffold(
      //  backgroundColor: Colors.lime,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: isData
                ? Image.asset(
                    'images/hot.jpg',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'images/cold.jpg',
                    fit: BoxFit.cover,
                  ),
          ),
          Center(
            child: showData == null
                ? Center(child: CircularProgressIndicator())
                : Text(
                    '${showData.toStringAsFixed(2)} degree C',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
