import 'package:flutter/material.dart';
import 'package:stroll/screens/widgets/header/header.dart';

class StrollDetails extends StatelessWidget {
  const StrollDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          // Header
          DetailsHeader(),
          // Content
          Container()
        ],
      )),
    );
  }
}
