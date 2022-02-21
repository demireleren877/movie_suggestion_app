import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 25.sp,
          ),
          onPressed: () {
            print('Menu');
          },
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
