import 'package:flutter/material.dart';
import 'package:stroll/screens/widgets/content/content_footer.dart';
import 'package:stroll/screens/widgets/content/options/options.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      color: Colors.black,
      child: Column(
        children: [
          Text(
            "\"Mine is definitely the peace in the morning.\"",
            style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onPrimary.withAlpha(100),
                fontStyle: FontStyle.italic),
          ),
          Options(),
          const SizedBox(height: 15),
          ContentFooter()
        ],
      ),
    );
  }
}
