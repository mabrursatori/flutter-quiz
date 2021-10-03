part of 'widgets.dart';

 class PrimaryBackground extends StatelessWidget {
   const PrimaryBackground({ Key key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return  Container(
          color: Colors.black26,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: MediaQuery.of(context).size.width,
              color: Color(0xff056961),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Transform.rotate(
                      angle: 0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_1.png'),
                        width: 60,
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Transform.rotate(
                      angle: -0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_2.png'),
                        width: 60,
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Transform.rotate(
                      angle: 0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_3.png'),
                        width: 60,
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Transform.rotate(
                      angle: 0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_4.png'),
                        width: 60,
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Transform.rotate(
                      angle: -0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_5.png'),
                        width: 60,
                      ),
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Transform.rotate(
                      angle: -0.5,
                      child: Image(
                        alignment: Alignment.centerRight,
                        image: AssetImage('images/mosque_6.png'),
                        width: 60,
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
        )
       ;
   }
 }