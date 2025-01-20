import 'package:crud_opration/home/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrudOpration());
}

class CrudOpration extends StatelessWidget {
  const CrudOpration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
