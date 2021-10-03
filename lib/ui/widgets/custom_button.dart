part of 'widgets.dart';

class CustomButton {
  static Widget blueButton(
      {@required String text,
      @required double width,
      @required Function onPressed}) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              width: width,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/blue_button.png"))),
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Hey Comic",
                  fontSize: 25,
                  shadows: [
                    Shadow(color: Colors.black, offset: Offset(1.5, 1.5))
                  ]),
            ),
          ),
        )
      ],
    );
  }

  static Widget orangeButton(
      {@required String text,
      @required double width,
      @required Function onPressed}) {
    return Stack(
      children: [
        Center(
          child: FloatingActionButton(
            onPressed: onPressed,
            child: Container(
              width: width,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/orange_button.png"))),
            ),
          ),
        ),
        Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Hey Comic",
              fontSize: 30,
              shadows: [Shadow(color: Colors.black, offset: Offset(1.5, 1.5))]),
        ))
      ],
    );
  }

  static Widget orangeXButton(
      {@required double width,
      @required Function onPressed,
      double marginBottom = 0}) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent)),
        onPressed: onPressed,
        child: Container(
          margin: EdgeInsets.only(bottom: marginBottom),
          width: width,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/orange_x_button.png"))),
        ));
  }

  static Widget circleButton(
      {@required double width,
      @required Function onPressed,
      @required String assetImage}) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: onPressed,
        backgroundColor: Colors.transparent,
        child:
            Image(width: width, height: width, image: AssetImage(assetImage)));
  }
}
