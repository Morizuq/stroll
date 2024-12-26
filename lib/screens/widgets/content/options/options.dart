import 'package:flutter/material.dart';
import 'package:stroll/theme/app_colors.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Dummy data for development
    final List<Map<String, String>> options = [
      {'label': 'The peace in the early mornings', 'id': 'A'},
      {'label': 'The magical golden hours', 'id': 'B'},
      {'label': 'Wind-down time after dinners', 'id': 'C'},
      {'label': 'The serenity past midnight', 'id': 'D'},
    ];

    final screenWidth = MediaQuery.sizeOf(context).width;

    final crossAxisCount = (screenWidth / 300).clamp(2, 5).round();
    final childAspectRatio = (screenWidth > 900)
        ? (5 / 1)
        : (3 / 1) + (screenWidth - 600).clamp(0, 300) / 300 * (2 / 1);

    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: optionTile(
                  Theme.of(context), options[index], _selectedIndex == index));
        });
  }
}

// Tile widget || Container for each option
Widget optionTile(
    ThemeData theme, Map<String, String> option, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.darkGrey,
      border: Border.all(
          color: isSelected ? AppColors.lavenderPurple : Colors.transparent,
          width: 2),
    ),
    child: Row(
      children: [
        optionId(theme, option['id']!, isSelected: isSelected),
        const SizedBox(width: 5),
        Expanded(
          child: Text(option['label']!,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.white.withAlpha(100), fontSize: 12)),
        ),
      ],
    ),
  );
}

// Option ID (A, B, C, D)
Widget optionId(ThemeData theme, String option, {bool isSelected = false}) {
  return Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isSelected ? AppColors.lavenderPurple : Colors.transparent,
      border: Border.all(
          color: isSelected ? Colors.transparent : Colors.white.withAlpha(100),
          width: 2),
    ),
    child: Text(option,
        style: theme.textTheme.bodySmall?.copyWith(
            color: isSelected ? Colors.white : Colors.white.withAlpha(100))),
  );
}
