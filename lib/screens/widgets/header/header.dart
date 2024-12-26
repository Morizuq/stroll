import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/screens/widgets/header/user_tile.dart';
import 'package:stroll/theme/app_colors.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/img_bg.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Stroll Header and Subheading
          Column(
            children: [
              SizedBox(height: 50),
              _strollHeader(theme),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _headerSubHeading('timer', '22h 00m', theme),
                  SizedBox(width: 10),
                  _headerSubHeading('person', '103', theme)
                ],
              ),
            ],
          ),
          // User Details Tile
          UserTile(),
        ],
      ),
    );
  }
}

Widget _strollHeader(ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Stroll Bonfire',
        style: theme.textTheme.titleLarge?.copyWith(
            fontSize: 30,
            color: AppColors.pastelPurple,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 5),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: SvgPicture.asset(
          'assets/icons/ic_arrow_down.svg',
          colorFilter:
              ColorFilter.mode(Colors.white.withAlpha(150), BlendMode.srcIn),
        ),
      ),
    ],
  );
}

Widget _headerSubHeading(String icon, String label, ThemeData theme) {
  return Row(
    children: [
      SvgPicture.asset('assets/icons/ic_$icon.svg'),
      SizedBox(width: 3),
      Text(label,
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onPrimary))
    ],
  );
}
