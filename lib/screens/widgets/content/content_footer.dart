import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/theme/app_colors.dart';

class ContentFooter extends StatelessWidget {
  const ContentFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick your option.",
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onPrimary)),
            Text("See who has a similar mind.",
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onPrimary))
          ],
        ),
        Row(
          children: [_buildRecorder(), const SizedBox(width: 10), _buildCTA()],
        )
      ],
    );
  }
}

Widget _buildRecorder() {
  return Container(
    width: 45,
    height: 45,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.lavenderPurple, width: 2),
    ),
    child: Center(
      child: SvgPicture.asset(
        'assets/icons/ic_recorder.svg',
        height: 25,
        width: 25,
        colorFilter:
            ColorFilter.mode(AppColors.lavenderPurple, BlendMode.srcIn),
      ),
    ),
  );
}

Widget _buildCTA() {
  return Container(
    width: 45,
    height: 45,
    decoration:
        BoxDecoration(shape: BoxShape.circle, color: AppColors.lavenderPurple),
    child: Center(child: Icon(Icons.arrow_forward_rounded, weight: 10)),
  );
}
