import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButton(
      {Key? key,
      required this.title,
      this.color = const Color(0xffF8F8F9),
      required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xff272B33),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
