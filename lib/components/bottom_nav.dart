import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll/screens/stroll_details.dart';
import 'package:stroll/theme/app_colors.dart';

class BottomNavbarBadge extends StatelessWidget {
  final int? count;
  final Widget child;

  const BottomNavbarBadge({
    super.key,
    required this.child,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final badgeSize = MediaQuery.sizeOf(context).width < 600 ? 14.0 : 16.0;
    return Align(
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          Positioned(top: 0, left: 15, child: badge(count, theme, badgeSize)),
        ],
      ),
    );
  }
}

Widget badge(int? count, ThemeData theme, double badgeSize) {
  return Container(
    constraints:
        BoxConstraints(minWidth: badgeSize, minHeight: badgeSize * 1.14),
    padding: EdgeInsets.symmetric(horizontal: badgeSize * 0.25, vertical: 0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: AppColors.lightPurple,
      border: Border.all(
        color: AppColors.darkerGrey,
        width: 2,
      ),
    ),
    child: Center(
      child: Text(
        count != null && count > 0
            ? count > 99
                ? '99+'
                : count.toString()
            : '10',
        style: theme.textTheme.bodySmall?.copyWith(
          color: count != null && count > 0
              ? AppColors.darkerGrey
              : AppColors.lightPurple,
          fontWeight: FontWeight.bold,
          fontSize: badgeSize * 0.35,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StrollDetails(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.darkGrey,
        items: <BottomNavigationBarItem>[
          _bottomNavbarItem('poker'),
          _bottomNavbarItem('fire', badgeCount: 0),
          _bottomNavbarItem('chat', badgeCount: 10),
          _bottomNavbarItem('person'),
        ],
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavbarItem(String icon, {int? badgeCount}) {
  return BottomNavigationBarItem(
    backgroundColor: AppColors.darkerGrey,
    icon: badgeCount != null ? BottomNavbarBadge(
      count: badgeCount,
      child: SvgPicture.asset(
        'assets/icons/ic_$icon.svg',
        width: 24,
        height: 24,
        colorFilter:
            ColorFilter.mode(Colors.white.withAlpha(100), BlendMode.srcIn),
      ),
    ) : SvgPicture.asset(
      'assets/icons/ic_$icon.svg',
      width: 24,
      height: 24,
      colorFilter:
          ColorFilter.mode(Colors.white.withAlpha(100), BlendMode.srcIn),
    ),
    label: '',
  );
}
