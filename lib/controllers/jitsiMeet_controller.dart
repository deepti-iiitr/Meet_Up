import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meet_up/controllers/auth_controller.dart';

class jitsiMeetingConroller {
  final AuthController _authController = AuthController();

  createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = _authController.user!.displayName
        ..userEmail = _authController.user!.email
        ..userAvatarURL = _authController.user!.photoURL // or .png

        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
