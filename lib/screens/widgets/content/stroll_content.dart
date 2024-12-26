import 'package:flutter/material.dart';
import 'package:stroll/screens/widgets/content/options/options.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.30,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      color: Colors.black,
      child: Column(
        children: [
          Options(),
        ],
      ),
    );
  }
}
