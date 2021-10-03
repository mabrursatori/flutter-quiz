part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ConfigBloc>().add(LoadConfig());
    return Scaffold(
        body: Stack(
      children: [
        widget.PrimaryBackground(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.CustomButton.blueButton(
                  text: "MAIN",
                  width: 100,
                  onPressed: () async {
                    await widget.SoundEffect.play("sound/click.wav");
                    Get.offAllNamed("/level");
                  }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Dukung kami melalui :",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Hey Comic", fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent)),
                      onPressed: () async {
                        await launchUrl(
                            "https://www.facebook.com/mabrur.assyirbuny");
                      },
                      child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage("images/fb.png"),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  EdgeInsets.zero),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent)),
                      onPressed: () async {
                        await launchUrl(
                            "https://www.instagram.com/mabrursatori/");
                      },
                      child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage("images/ig.png"),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent)),
                  onPressed: () async {
                    await launchUrl("https://trakteer.id/mabrur-svs5h/tip");
                  },
                  child: Image(
                    height: 50,
                    image: AssetImage("images/trakteer.png"),
                  )),
            ],
          ),
        )
      ],
    ));
  }

  Future<void> launchUrl(String urlString) async {
    await canLaunch(urlString)
        ? await launch(urlString, enableJavaScript: true, forceWebView: true)
        : throw 'Could not launch $urlString';
  }
}
