import 'package:crud_opration/core/cache/cached_helper.dart';
import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:crud_opration/home/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.initil();

  runApp(const CrudOpration());
}

class CrudOpration extends StatelessWidget {
  const CrudOpration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorManger.kscaffoldBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
