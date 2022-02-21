import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytmdbmovie/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          ModifiedText('Popular TV Show', Colors.white, 25.0,),
          SizedBox(height: 10.0),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index) {
                return InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500'+
                                          tv[index]['backdrop_path'],
                                  ),fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          height: 140,
                          width: 250,
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                            child: ModifiedText(
                                tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'Loading',
                                Colors.white,26.0
                            )


                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: tv.length,
            ),

          )
        ],
      ),
    );
  }
}
