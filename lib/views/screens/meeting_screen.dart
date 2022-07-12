import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meet_up/controllers/jitsiMeet_controller.dart';
import 'package:meet_up/views/screens/video_screen.dart';
import 'package:meet_up/views/screens/widgets/resuable_icons.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final jitsiMeetingConroller _jitsiController = jitsiMeetingConroller();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(this.context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusabelIcon(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            ReusabelIcon(
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              onPressed: joinMeeting,
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Text(
              'Create/ Join a meeting with just one click',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    ));
  }
}
