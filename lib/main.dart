import 'package:flutter/material.dart';
import 'package:wordpress_api_app/src/views/home.dart';

void main() {
  runApp(MyApp());
}

// running to application will only work when connected to API generated from Wordpress
// Wordpress SITE MUST BE ACTIVE

// Without connectioned to Wordpress API, the generated list returns empty
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordpress Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
