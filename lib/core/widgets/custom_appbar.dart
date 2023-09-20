import 'package:ecommerce/core/widgets/custom_circle_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCircleButton(
          icon: icon,
          onPressed: onPressed,
        ),
        Text(
          title,
          style: TextStyle(fontSize: size.width * .06),
        ),
        SizedBox(
          width: size.width * .12,
        ),
      ],
    );
  }
}
