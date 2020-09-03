import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atividade_video/heroes_controller.dart';
import 'package:atividade_video/heroes_model.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

  
class _HomeWidgetState extends State<HomeWidget> {
  
  _buildList(){
    
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index){
        return _buildItem(heroesController.heroes[index]);
      }
    );
  }

  _buildItem(HeroModel model){
    HeroesController heroesController = Provider.of<HeroesController>(context);
    return ListTile(
      onTap: (){
        heroesController.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: 
      model.isFavorite ?
      Icon(Icons.star, color: Colors.yellow,) :
      Icon(Icons.star_border),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
        leading: Consumer<HeroesController>(
          builder: (context, heroesController, widget){
            return Center(
              child: Text(
                "${heroesController.heroes.where((i) => i.isFavorite).length}", 
                style: TextStyle(fontSize: 18),
                )
          );}
        ),
      ),
      body: Consumer<HeroesController>(
        builder: (context, heroesController, widget){
          return _buildList();
      },),
    );
  }
}