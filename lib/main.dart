import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/core/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrudOpration());
}

class CrudOpration extends StatelessWidget {
  const CrudOpration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManger.kscaffoldBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
