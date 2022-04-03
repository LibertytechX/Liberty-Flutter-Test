import 'package:flutter/material.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({
    Key? key,
    required this.title,
    required this.count,
    required this.iconBackground,
    this.background,
    required this.icon,
  }) : super(key: key);
  final String title;
  final int count;
  final Color iconBackground;
  final Color? background;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      width: 153,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: background ?? iconBackground.withOpacity(0.12),
        child: Stack(
          children: [
            Align(
              alignment: const FractionalOffset(0.13, 0.13),
              child: RoundedIcon(
                backgroundColor: iconBackground,
                icon: icon,
              ),
            ),
            Align(
                alignment: const FractionalOffset(0.9, 0.18),
                child: Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline3,
                )),
            Align(
                alignment: const FractionalOffset(0.2, 0.9),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                )),
          ],
        ),
      ),
    );
  }
}
