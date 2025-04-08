import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// just_audio 패키지
// 고급 오디오 제어가 가능한 패키지입니다.
// Android, iOS, macOS 에서 호환됩니다.
// pubspec.yaml 파일을 열고 필요한 디펜던시를 추가해야 합니다.
// pubspec.yaml 파일을 열고 정적 파일의 경로를 등록해야 합니다.

// 재생 목록 : ConcatenatingAudioSource 로 트랙 리스트 관리
// 반복 모드 : player.setLoopMode(LoopMode.one)
// 볼륨 조절 : player.setSpeed(1.5)
// 속도 조절 : player.setVolume(0.8)

class JustAudioWidget extends StatefulWidget {
  const JustAudioWidget({super.key});
  @override
  State<StatefulWidget> createState() => _JustAudioState();
}

class _JustAudioState extends State<JustAudioWidget> {

  final audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _audioPlay() async {
    // assets
    await audioPlayer.setAsset("assets/audios/t-rex-roar.mp3");
    // network
    // await player.setUrl("https://example.com/audio.mp3");
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _audioPlay();
      },
      child: const Text("t-rex-roar.mp3"),
    );
  }

}