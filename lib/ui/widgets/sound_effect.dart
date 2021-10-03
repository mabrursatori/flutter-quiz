part of 'widgets.dart';

class SoundEffect {
  static final assetsAudioPlayer = AssetsAudioPlayer();

  static Future<void> play(url) async {
    await assetsAudioPlayer.open(Audio(url),
        autoStart: true, showNotification: true);
  }
}
