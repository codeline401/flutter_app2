import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  OrientationLayoutIconWidget(),
                  Divider(),
                  OrientationlayoutWidget(),
                  Divider(),
                  GridViewWidget(),
                  Divider(),
              ],
            ),
          ),
        ),
        ),
    );
  }
}

class OrientationLayoutIconWidget extends StatelessWidget {
  const OrientationLayoutIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    //La varibale qui contiendra l'orientation du matériel (portrait or landscape)
    Orientation orientation = MediaQuery.of(context).orientation;

    //The objectif is to return a single Row icon if the orientation is protrait
    //and return a Row of two Icon widget if the orientation is landscape
    return orientation == Orientation.portrait ?
    const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.school,
          size: 48.0,
        ),
      ],
    )
    : const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.school,
          size : 48.0,
        ),
        Icon(
          Icons.brunch_dining,
          size: 48.0,
        ),
      ],
    )
    ;
  }
}

class OrientationlayoutWidget extends StatelessWidget {
  const OrientationlayoutWidget({super.key});
  
  //The objectif here is to return a Container with à different color if 
  //the mediaQuery orientation is portrait or landscape

  @override
  Widget build(BuildContext context) {

    //variable wich will contains the orientation
    Orientation orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait ?
    Container(
      color: Colors.yellowAccent,
      height: 100.0,
      alignment: Alignment.center,
      child: const Text('Orientation en protrait'),
    )
    :
    Container(
      color: Colors.lime,
      height: 80.0,
      alignment: Alignment.center,
      child: const Text('Orientation en paysage'),
    )
    ;
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {

  //Variable wich will contains the orientation of the mediaQuery
  Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.count( //permet de créer une grille(grid) d'enfants avec un nombre fixe de
    //colonne
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4 ,
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) => Text("Grid $index", textAlign: TextAlign.center,)),
    );
  }
}