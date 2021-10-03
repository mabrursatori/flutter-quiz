part of 'pages.dart';

class QuestionListPage extends StatelessWidget {
  final int level = int.tryParse(Get.parameters['level']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            await widget.SoundEffect.play("sound/click.wav");
            Get.offAllNamed("/level");
            return;
          },
          child: Stack(
            children: [
              widget.PrimaryBackground(),
              BlocBuilder<ConfigBloc, ConfigState>(
                builder: (context, state) {
                  if (state is ConfigLoaded) {
                    List<Question> questions = state.config[level].questions;
                    final double runSpacing = 4;
                    final double spacing = 4;
                    final columns = 3;
                    final width = (MediaQuery.of(context).size.width -
                                runSpacing * (columns - 1)) /
                            columns -
                        20;
                    return Center(
                      child: Wrap(
                        runSpacing: runSpacing,
                        spacing: spacing,
                        alignment: WrapAlignment.center,
                        children: List.generate(questions.length, (index) {
                          return Container(
                            width: width,
                            height: 70,
                            child: (index == 0 ||
                                    questions[index - 1].isFinish == true)
                                ? widget.CustomButton.blueButton(
                                    text: "Buka",
                                    width: width,
                                    onPressed: () async {
                                      widget.SoundEffect.play(
                                          "sound/click.wav");
                                      Get.offAllNamed(
                                          "/question/${level.toString()}/${index.toString()}");
                                    })
                                : widget.CustomButton.orangeXButton(
                                    width: width, onPressed: () {}),
                          );
                        }),
                      ),
                    );
                  } else {
                    return Text("Failed");
                  }
                },
              ),
            ],
          )),
    );
  }
}
