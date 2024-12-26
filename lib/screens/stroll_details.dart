import 'package:flutter/material.dart';
import 'package:stroll/screens/widgets/content/stroll_content.dart';
import 'package:stroll/screens/widgets/header/header.dart';

class StrollDetails extends StatelessWidget {
  const StrollDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header
          DetailsHeader(),
          // Content
          DetailsContent()
        ],
      )),
    );
  }
}
