import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meet_up/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  const MeetingOption(
      {Key? key,
      required this.text,
      required this.isMute,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Switch(value: isMute, onChanged: onChange)
      ]),
    );
  }
}
