part of 'pages.dart';

class LevelPage extends StatelessWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            await widget.SoundEffect.play("sound/click.wav");
            Get.offAllNamed("/");
            return;
          },
          child: Stack(
            children: [
              widget.PrimaryBackground(),
              Center(child: BlocBuilder<ConfigBloc, ConfigState>(
                builder: (context, state) {
                  if (state is ConfigLoaded) {
                    List<Level> levels = state.config;
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: levels.map((e) {
                          if (e.level == 1 ||
                              levels[levels.indexOf(e) - 1].isFinish == true) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: widget.CustomButton.blueButton(
                                  text: "Level ${e.level}",
                                  width: 150,
                                  onPressed: () async {
                                    await widget.SoundEffect.play(
                                        "sound/click.wav");
                                    await Get.offAllNamed("/questions/" +
                                        levels.indexOf(e).toString());
                                  }),
                            );
                          } else {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: widget.CustomButton.orangeXButton(
                                  width: 150,
                                  onPressed: () async {
                                    await widget.SoundEffect.play(
                                        "sound/click.wav");
                                  }),
                            );
                          }
                        }).toList(),
                      ),
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              )),
            ],
          )),
    );
  }
}
