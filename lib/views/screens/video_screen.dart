import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meet_up/controllers/auth_controller.dart';
import 'package:meet_up/utils/colors.dart';
import 'package:meet_up/views/screens/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;

  late TextEditingController nameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  final AuthController _authController = AuthController();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authController.user!.displayName,
    );
    super.initState();
  }

  _joinMeeting() {
    isAudioMuted = isAudioMuted;
    isVideoMuted = isVideoMuted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text('Join a meeting'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room Id',
              contentPadding: EdgeInsets.all(20),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: nameController,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: InputDecoration(
              fillColor: secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'User Name',
              contentPadding: EdgeInsets.all(20),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Join',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          SizedBox(
            height: 10,
          ),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onVedioMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVedioMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
