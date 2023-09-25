import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Package {
  List<String>? duration;
  List<String>? package;

  Package({this.duration, this.package});

  Package.fromJson(Map<String, dynamic> json) {
    duration = json['duration'].cast<String>();
    package = json['package'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['duration'] = duration;
    data['package'] = package;
    return data;
  }
}

extension PackageExtension on String {
  IconData get iconData {
    if(this == "Messaging") return Icons.message_rounded;
    if(this == "Voice Call") return Icons.call_rounded;
    if(this == "Video Call") return Icons.video_call_rounded;
    return Icons.person_rounded;
  }

  String get secondaryText {
    if(this == "Messaging") return "Chat with Doctor";
    if(this == "Voice Call") return "Voice call with doctor";
    if(this == "Video Call") return "Video call with doctor";
    return "In Person visit with doctor";
  }
}
