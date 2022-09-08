import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/movie_model.dart';

class MovieProvider extends ChangeNotifier{
MovieModel? movieModel;


bool get movieData=>movieModel!=null;

void getMovieApiData()async{
  final url=Uri.parse('https://yts.mx/api/v2/list_movies.json');
 
  try{
    final response= await get(url);
    final map=jsonDecode(response.body);
    if(response.statusCode==200){
      movieModel=MovieModel.fromJson(map);
      print(movieModel!.data!.movies!.length);
      notifyListeners();

    }
    else{
      print('can not fetch url');
    }
  }catch(err){
    rethrow;
  }
 
  
}

}