import 'package:flutter/material.dart';
import 'package:mytmdbmovie/utils/text.dart';

class Description extends StatelessWidget {
  final String name,description,bannerUrl,posterUrl,vote,launchOn;

  Description(this.name, this.description, this.bannerUrl, this.posterUrl,
      this.vote, this.launchOn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl,fit: BoxFit.cover,),
                  )),
                  Positioned(child: ModifiedText(
                    '      ✰ Average Rating ' + vote , Colors.amberAccent, 40.0
                  ),bottom: 10.0,)
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.all(10.0),
              child: ModifiedText(
                name!=null?name:'Not Loaded',Colors.white,26.0
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: ModifiedText(
                'Releasing on - ' + launchOn,Colors.white,14.0
              ),
            ),
            /*Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                  height: 200.0,
                  width: 100.0,
                  child: Image.network(bannerUrl),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      description,Colors.white,18.0
                    ),
                  ),
                )
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
