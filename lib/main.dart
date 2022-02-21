import 'package:flutter/material.dart';
import 'package:mytmdbmovie/widgets/toprated.dart';
import 'package:mytmdbmovie/widgets/trending.dart';
import 'package:mytmdbmovie/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.redAccent
      ),
      home: Home(),
    );
  }

  
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRated = [];
  List tv = [];
  final String apiKey = '356575d0857857a58034cc86144df74d';
  final String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTY1NzVkMDg1Nzg1N2E1ODAzNGNjODYxNDRkZjc0ZCIsInN1YiI6IjYxNmFlMTEzZWMxODc5MDA2MThiYTBkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L824qVVRH8oDW7Rfa78QAeGU6Tuz3DMkTu-iq36VIn8';

  @override
  void initState(){
    loadMovies();
    super.initState();
  }

  loadMovies() async{
    TMDB customLogsTmdb = TMDB(
        ApiKeys(apiKey,readAccessToken),
        logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    ));

    Map trendingResult = await customLogsTmdb.v3.trending.getTrending();
    Map topRatedResult = await customLogsTmdb.v3.movies.getTopRated();
    Map tvResult = await customLogsTmdb.v3.tv.getPouplar();

    print(trendingResult);

    setState(() {
      trendingMovies = trendingResult['results'];
      topRated = topRatedResult['results'];
      tv = tvResult['results'];
      print(trendingMovies);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Morteza Movie App ♡ '),backgroundColor: Colors.redAccent,),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRatedMovies(topRated: topRated),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}

