part of 'widgets.dart';

class CustomDialog {
  static void showDialog(context,
      {Function firstButton,
      Function secondButton,
      String firstText,
      String secondText}) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        (firstButton != null)
                            ? ElevatedButton(
                                onPressed: firstButton, child: Text(firstText))
                            : SizedBox(),
                        (secondButton != null)
                            ? ElevatedButton(
                                onPressed: secondButton,
                                child: Text(secondText))
                            : SizedBox(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 3));
  }

  static void failedDialog(
    context, {
    @required Function onPressed,
  }) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: 150,
                        image: AssetImage("images/failed_expression.png")),
                    Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              "Yaaah jawabannya masih salah, yuk ulangi lagi",
                              style: TextStyle(
                                  fontFamily: "Hey Comic", fontSize: 15),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            height: 80,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CustomButton.circleButton(
                                  width: 40,
                                  onPressed: onPressed,
                                  assetImage: "images/x_button.png"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1));
  }

  static void rightDialog(context,
      {@required Function onPressedExplain, @required Function onPressedNext}) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: 150,
                        image: AssetImage("images/congrats_expression.png")),
                    Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              "Yeaay jawaban kamu benar, yuk simak penjelasannya nya!",
                              style: TextStyle(
                                  fontFamily: "Hey Comic", fontSize: 15),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            height: 80,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton.circleButton(
                                    width: 40,
                                    onPressed: onPressedExplain,
                                    assetImage: "images/play_button.png"),
                                CustomButton.circleButton(
                                    width: 40,
                                    onPressed: onPressedNext,
                                    assetImage: "images/continue_button.png")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1));
  }

  static void levelDoneDialog(context,
      {@required Function onPressedExplain, @required Function onPressedNext}) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: 150,
                        image: AssetImage("images/congrats_expression.png")),
                    Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              'Yeaay kamu berhasil menyelesaikan level ini, yuk langsung ke level selanjutnya! \n',
                              style: TextStyle(
                                  fontFamily: "Hey Comic", fontSize: 15),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            height: 105,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton.circleButton(
                                    width: 40,
                                    onPressed: onPressedExplain,
                                    assetImage: "images/play_button.png"),
                                CustomButton.circleButton(
                                    width: 40,
                                    onPressed: onPressedNext,
                                    assetImage: "images/continue_button.png")
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1));
  }

  static void allDonDialog(
    context, {
    @required Function onPressed,
  }) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        width: 150,
                        image: AssetImage("images/cool_expression.png")),
                    Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              "Waah kamu hebat bisa nyelesain semua tantangan dari kami! Yuk Dukung kami dengan Like FB dan IG kami, kalo bisa donasi lewat Trakteer yaaaa",
                              style: TextStyle(
                                  fontFamily: "Hey Comic", fontSize: 15),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            height: 125,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CustomButton.circleButton(
                                  width: 40,
                                  onPressed: onPressed,
                                  assetImage: "images/home_button.png"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        animationType: DialogTransitionType.scale,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1));
  }
}
