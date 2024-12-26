import 'package:flutter/material.dart';
import 'package:stroll/components/buttons/option_buttons.dart';

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
          return OptionButton(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              option: options[index],
              isSelected: _selectedIndex == index);
        });
  }
}

// Tile widget || Container for each opti
