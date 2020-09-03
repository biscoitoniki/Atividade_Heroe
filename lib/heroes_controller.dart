import 'package:atividade_video/heroes_model.dart';
import 'package:flutter/cupertino.dart';

class HeroesController extends ChangeNotifier{
  List<HeroModel> heroes = [
    HeroModel(name: "Thor"),
    HeroModel(name: "Iron Man"),
    HeroModel(name: "Batman"),
    HeroModel(name: "Capptan America"),
    HeroModel(name: "Superman"),
  ];

  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}