part of 'pages.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final int indexLevel = int.tryParse(Get.parameters['indexLevel']);
  final int indexQuestion = int.tryParse(Get.parameters['indexQuestion']);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ConfigBloc>().add(LoadConfig());
    return Builder(builder: (BuildContext context) {
      if (!_loadingAnchoredBanner) {
        _loadingAnchoredBanner = true;
        _createAnchoredBanner(context);
      }

      return Scaffold(
        body: WillPopScope(
            onWillPop: () async {
              await widget.SoundEffect.play("sound/click.wav");
              Get.offAllNamed("/questions/" + indexLevel.toString());
              return;
            },
            child: Stack(
              children: [
                widget.PrimaryBackground(),
                ListView(
                  children: [
                    BlocBuilder<ConfigBloc, ConfigState>(
                      builder: (context, state) {
                        if (state is ConfigLoaded) {
                          Question question =
                              state.config[indexLevel].questions[indexQuestion];
                          List<String> answers =
                              utils.ListUtils.shuffle(question.answers);
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 90,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Text(
                                    question.question,
                                    style: TextStyle(
                                        fontFamily: "Roboto", fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ...answers.map((e) => Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: widget.CustomButton.blueButton(
                                          text: e,
                                          width: 400,
                                          onPressed: () async {
                                            if (e == question.trueAnswer) {
                                              context.read<ConfigBloc>().add(
                                                  UpdateConfig(
                                                      indexLevel: indexLevel,
                                                      indexQuestion:
                                                          indexQuestion));
                                              widget.SoundEffect.play(
                                                  "sound/yeay.wav");
                                              if (indexQuestion == 9 &&
                                                  indexLevel == 4) {
                                                //In The Last Question and The Last Level
                                                widget.CustomDialog
                                                    .allDonDialog(context,
                                                        onPressed: () async {
                                                  await Get.offAllNamed(
                                                      "/level");
                                                });
                                              } else if (indexQuestion == 9 &&
                                                  indexLevel < 4) {
                                                //Just The Last Question
                                                widget.CustomDialog
                                                    .levelDoneDialog(context,
                                                        onPressedExplain:
                                                            () async {
                                                  await Get.offAllNamed(
                                                      "/description/${indexLevel.toString()}/${indexQuestion.toString()}");
                                                }, onPressedNext: () async {
                                                  await Get.offAllNamed(
                                                      "/level");
                                                });
                                              } else {
                                                widget.CustomDialog.rightDialog(
                                                    context,
                                                    onPressedExplain: () async {
                                                  await Get.offAllNamed(
                                                      "/description/${indexLevel.toString()}/${indexQuestion.toString()}");
                                                }, onPressedNext: () async {
                                                  await Get.offAllNamed(
                                                      "/question/${indexLevel.toString()}/${(indexQuestion + 1).toString()}");
                                                });
                                              }
                                            } else {
                                              // if false
                                              widget.SoundEffect.play(
                                                  "sound/awh.wav");
                                              widget.CustomDialog.failedDialog(
                                                  context, onPressed: () {
                                                Navigator.of(context).pop();
                                              });
                                              setState(() {
                                                answers =
                                                    utils.ListUtils.shuffle(
                                                        answers);
                                              });
                                            }
                                          }),
                                    ))
                              ],
                            ),
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    )
                  ],
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
                                style: TextStyle(
                                    fontFamily: "Hey Comic", fontSize: 20)),
                            Text(
                                "Tantangan: ${(indexQuestion + 1).toString()}/10",
                                style: TextStyle(
                                    fontFamily: "Hey Comic", fontSize: 20)),
                          ],
                        ),
                        widget.CustomButton.circleButton(
                            width: 50,
                            onPressed: () async {
                              await widget.SoundEffect.play("sound/click.wav");
                              await Get.offAllNamed(
                                  "/questions/${indexLevel.toString()}");
                            },
                            assetImage: "images/back_button.png")
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: (_anchoredBanner != null)
                      ? Container(
                          width: _anchoredBanner.size.width.toDouble(),
                          height: _anchoredBanner.size.height.toDouble(),
                          child: AdWidget(ad: _anchoredBanner),
                        )
                      : SizedBox(),
                )
              ],
            )),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd _anchoredBanner;
  bool _loadingAnchoredBanner = false;
  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }
}
