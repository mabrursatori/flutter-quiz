part of 'pages.dart';

class DescriptionPage extends StatelessWidget {
  final int indexLevel = int.tryParse(Get.parameters['indexLevel']);
  final int indexQuestion = int.tryParse(Get.parameters['indexQuestion']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        await widget.SoundEffect.play("sound/click.wav");
        if (indexQuestion == 9 && indexLevel == 4) {
          await Get.offAllNamed("/");
        } else if (indexQuestion == 9 && indexLevel < 4) {
          await Get.offAllNamed("/level");
        } else {
          await Get.offAllNamed(
              "/question/${indexLevel.toString()}/${(indexQuestion + 1).toString()}");
        }
        return;
      },
      child: Stack(
        children: [
          widget.PrimaryBackground(),
          BlocBuilder<ConfigBloc, ConfigState>(
            builder: (context, state) {
              if (state is ConfigLoaded) {
                Question question =
                    state.config[indexLevel].questions[indexQuestion];
                return SafeArea(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 90,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Penjelasan :",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  question.description,
                                  style: TextStyle(
                                      fontFamily: "Roboto", fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          (question.quran != null)
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Text(
                                        question.quran,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      ),
                                      Text(
                                        question.quranTranslate,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                          (question.hadits != null)
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Text(
                                        question.hadits,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      ),
                                      Text(
                                        question.haditsTranslate,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 20,
                          ),
                          (question.kitab != null)
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Text(
                                        question.kitab,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      ),
                                      Text(
                                        question.kitabTranslate,
                                        style: TextStyle(
                                            fontFamily: "Roboto", fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox()
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 75,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Level: ${(indexLevel + 1).toString()}/5",
                          style:
                              TextStyle(fontFamily: "Hey Comic", fontSize: 20)),
                      Text("Quiz: ${(indexQuestion + 1).toString()}/10",
                          style:
                              TextStyle(fontFamily: "Hey Comic", fontSize: 20)),
                    ],
                  ),
                  widget.CustomButton.circleButton(
                      width: 50,
                      onPressed: () async {
                        await widget.SoundEffect.play("sound/click.wav");
                        if (indexQuestion == 9 && indexLevel == 4) {
                          await Get.offAllNamed("/");
                        } else if (indexQuestion == 9 && indexLevel < 4) {
                          await Get.offAllNamed("/level");
                        } else {
                          await Get.offAllNamed(
                              "/question/${indexLevel.toString()}/${(indexQuestion + 1).toString()}");
                        }
                      },
                      assetImage: "images/continue_button.png")
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
