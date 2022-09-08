import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';
import 'movie_details_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieProvider provider;
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if (isFirst) {
      provider = Provider.of<MovieProvider>(context);
      provider.getMovieApiData();
      isFirst = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: provider.movieData
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: provider.movieModel!.data!.movies!.length,
              itemBuilder: (context, index) {
                final movieM = provider.movieModel!.data!.movies![index];
                return Expanded(
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, MovieDetailsPage.routeName,
                          arguments: movieM),
                      child: Stack(children: [
                        Image.network(movieM.backgroundImageOriginal!),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ListTile(
                            title: Text(movieM.title!,style: TextStyle(fontSize: 10),),
                            subtitle: Text(movieM.year!.toString()),
                            trailing: Text(movieM.rating.toString()),
                          ),
                        ),
                      ]),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
