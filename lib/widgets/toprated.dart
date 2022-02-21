import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytmdbmovie/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;
  const TopRatedMovies({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          ModifiedText('Top Rated Movies', Colors.white, 25.0,),
          SizedBox(height: 10.0),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) {
                return InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+
                                          topRated[index]['poster_path']
                                  )
                              )
                          ),
                          height: 200,
                        ),
                        Container(
                            child: ModifiedText(
                                topRated[index]['title'] != null
                                    ? topRated[index]['title']
                                    : 'Loading',
                                Colors.white,26.0
                            )


                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: topRated.length,
            ),

          )
        ],
      ),
    );
  }
}
