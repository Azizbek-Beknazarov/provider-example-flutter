import 'package:flutter/material.dart';


class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.isTop = false,
    this.isBottom = false,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  final Widget icon;
  final Widget? trailing;
  final String text;
  final bool isTop;
  final bool isBottom;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft:
              (isBottom) ? const Radius.circular(12) : const Radius.circular(0),
          bottomRight:
              (isBottom) ? const Radius.circular(12) : const Radius.circular(0),
          topLeft:
              (isTop) ? const Radius.circular(12) : const Radius.circular(0),
          topRight:
              (isTop) ? const Radius.circular(12) : const Radius.circular(0),
        ),
      ),
      leading: icon,
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
            // color: ThemeColors.light.midGray,
          ),
    );
  }
}
