import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color(0xff1D2337),
          blurRadius: 10,
        ),
        BoxShadow(
          color: Color(0xff1D2337),
          blurRadius: 10,
        )
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: CircleAvatar(
        backgroundColor: const Color(0xff0D111F),
        radius: 20,
        child: InkWell(
          onTap: onPressed,
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
