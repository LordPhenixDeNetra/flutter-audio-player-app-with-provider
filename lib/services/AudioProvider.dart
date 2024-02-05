

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void setPlayingState(bool value) {
    isPlaying = value;
    notifyListeners();
  }

  void setDuration(Duration newDuration) {
    duration = newDuration;
    notifyListeners();
  }

  void setPosition(Duration newPosition) {
    position = newPosition;
    notifyListeners();
  }
}