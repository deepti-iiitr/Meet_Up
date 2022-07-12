import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meet_up/utils/colors.dart';

class ReusabelIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ReusabelIcon(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(
                  16,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(
                      0.7,
                    ),
                  )
                ]),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
