import 'package:films_rates/films_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Derecelendirmeview extends StatefulWidget {
  const Derecelendirmeview({Key? key}) : super(key: key);

  @override
  State<Derecelendirmeview> createState() => _DerecelendirmeviewState();
}

class _DerecelendirmeviewState extends State<Derecelendirmeview> {
  late List<FilmModel> films2 = [];
  final List<FilmModel> films = [
    FilmModel(imdb: 7.2, name: 'Nefesini Tut', genre: 'Korku', year: 2016),
    FilmModel(imdb: 8.0, name: 'Başka Bir Film', genre: 'Aksiyon', year: 2020),
    FilmModel(imdb: 6.5, name: 'Gizemli Film', genre: 'Gizem', year: 2018),
    FilmModel(imdb: 7.8, name: 'Komedi Film', genre: 'Komedi', year: 2019),
    FilmModel(imdb: 6.9, name: 'Drama Film', genre: 'Dram', year: 2017),
  ];
  late String _tur = '';

  void _revise() {
    String turlistele = _tur;
    setState(() {
      films2.clear();
      for (var i = 0; i < films.length; i++) {
        if (films[i].genre == _tur) {
          films2.add(films[i]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.pink[100],
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text('TÜRLER',
                  style: Theme.of(context).textTheme.headline4?.copyWith()),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              _textButton('Korku'),
              _textButton('Aksiyon'),
              _textButton('Gizem'),
              _textButton('Komedi'),
              _textButton('Dram'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Filmler',
            style: Theme.of(context).textTheme.headline3?.copyWith()),
        centerTitle: true,
        actions: [],
      ),
      body: ListView.builder(
        itemCount: films2.isNotEmpty ? films2.length : films.length,
        itemBuilder: (context, index) {
          final film = films2.isNotEmpty ? films2[index] : films[index];
          return Column(
            children: [
              const Padding(padding: EdgeInsets.all(20)),
              Text('${film.name} (${film.year})',
                  style: Theme.of(context).textTheme.headline4),
              const _FilmsImage(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                verticalDirection: VerticalDirection.up,
                children: [
                  const RatingWidget(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${film.imdb} IMBD',
                          style: Theme.of(context).textTheme.bodyText1),
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.comment_sharp, size: 30),
                        label: const Text('Yorumlar'),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  TextButton _textButton(tur) {
    return TextButton(
        onPressed: () {
          setState(() {
            _tur = tur;
          });
          _revise();
        },
        child: Text(' $tur',
            style: Theme.of(context).textTheme.headline6?.copyWith()));
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class _FilmsImage extends StatelessWidget {
  const _FilmsImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: Placeholder(
        color: Colors.black45,
      ),
    );
  }
}
