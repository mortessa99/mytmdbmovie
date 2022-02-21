import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytmdbmovie/description.dart';
import 'package:mytmdbmovie/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          ModifiedText('Trending Movies', Colors.white, 25.0,),
          SizedBox(height: 10.0),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                trending[index]['title'],
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                                 trending[index]['overview'],
                                trending[index]['vote_average']
                                    .toString(),
                                trending[index]
                                ['release_date'],
                              )));
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
                                    trending[index]['poster_path']
                                )
                              )
                            ),
                            height: 200,
                          ),
                          Container(
                            child: ModifiedText(
                              trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading',
                              Colors.white,26.0
                            )


                          )
                        ],
                      ),
                    ),
                  );
            },
              itemCount: trending.length,
            ),

          )
        ],
      ),
    );
  }
}
