import 'package:flutter/material.dart';
import 'package:stroll/screens/widgets/content/content_footer.dart';
import 'package:stroll/screens/widgets/content/options/options.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 16,
      ),
      color: Colors.black,
      child: Column(
        spacing: 15,
        children: [Options(), ContentFooter()],
      ),
    );
  }
}
