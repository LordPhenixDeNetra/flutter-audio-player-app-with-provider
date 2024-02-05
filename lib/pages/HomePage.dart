import 'package:audioplayers/audioplayers.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:n_audio_player_with_provider/services/AudioProvider.dart';
import 'package:provider/provider.dart';


/*
class AudioPlayerModel extends ChangeNotifier {
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

*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioProvider(),
      child: HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    final audioPlayerModel = Provider.of<AudioProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage("images/disque_2.png"),
              ),
            SizedBox(
              height: 32,
            ),
            Text(
              "The Flutter Song",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Sarah Abs",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Slider(
              min: 0,
              max: audioPlayerModel.duration.inSeconds.toDouble(),
              value: audioPlayerModel.position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayerModel.audioPlayer.seek(position);

                // Optional: Play audio if it was paused
                await audioPlayerModel.audioPlayer.resume();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(audioPlayerModel.position)),
                  Text(formatTime(audioPlayerModel.duration - audioPlayerModel.position)),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                onPressed: () async {
                  if (audioPlayerModel.isPlaying) {
                    await audioPlayerModel.audioPlayer.pause();
                  } else {
                    String url =
                        "https://www.auboutdufil.com/get.php?fla=https://archive.org/download/karol-piczak-les-champs-etoiles/KarolPiczak-LesChampsEtoiles.mp3";
                    await audioPlayerModel.audioPlayer.play(UrlSource(url));
                  }
                  audioPlayerModel.setPlayingState(!audioPlayerModel.isPlaying);
                },
                icon: Icon(
                  audioPlayerModel.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
  
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
