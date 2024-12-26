import 'package:flutter/material.dart';
import 'package:stroll/theme/app_colors.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({super.key, required this.option, required this.isSelected, required this.onTap});
  final Map<String, String> option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            _optionId(theme, option['id']!, isSelected: isSelected),
            const SizedBox(width: 5),
            Expanded(
              child: Text(option['label']!,
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withAlpha(100), fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _optionId(ThemeData theme, String option, {bool isSelected = false}) {
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
