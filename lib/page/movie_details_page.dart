import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class MovieDetailsPage extends StatefulWidget {
  static const String routeName = '/movie_details';
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Movies movieM;
  @override
  void didChangeDependencies() {
    movieM = ModalRoute.of(context)!.settings.arguments as Movies;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.network(
            movieM.backgroundImage!,
            height: 200,
            width: double.maxFinite,
          ),
          ListTile(
            title: Text(movieM.title!),
            subtitle: Text(movieM.rating!.toString()),
            trailing: Text(movieM.language!),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(movieM.descriptionFull!)
        ],
      ),
    );
  }
}
