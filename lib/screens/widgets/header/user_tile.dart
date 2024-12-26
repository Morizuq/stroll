import 'package:flutter/material.dart';
import 'package:stroll/theme/app_colors.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height * 0.13,
      width: width,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
        colors: [
          Colors.black.withAlpha(10),
          Colors.black.withAlpha(80),
          Colors.black.withAlpha(190),
          Colors.black.withAlpha(204),
          Colors.black,
        ],
      )),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              _userDetails(theme: theme),
              Positioned(
                left: 70,
                top: 35,
                child: SizedBox(
                  width: width - 130,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "What is your favorite time of the day?",
                      style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _userDetails({required ThemeData theme}) {
  return SizedBox(
    width: double.infinity,
    height: 80,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 30,
          top: 10,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 2, 5, 2),
            decoration: BoxDecoration(
              color: AppColors.darkerGrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Angelina, 28",
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: theme.colorScheme.onPrimary),
            ),
          ),
        ),
        Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkerGrey, width: 4),
            ),
            child: Image.asset('assets/images/img_angelina.png')),
      ],
    ),
  );
}
