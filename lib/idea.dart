import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

class Idea extends StatefulWidget {
  final String title;
  final Function delete;
  final Function edit;

  const Idea({Key key, this.title, this.delete, this.edit}) : super(key: key);

  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  double _offsetX = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (info) {
        setState(() {
          _offsetX += info.primaryDelta / MediaQuery.of(context).size.width;
        });
      },
      onHorizontalDragEnd: (info) {
        setState(() {
          if (_offsetX <= -0.15) {
            _offsetX = -0.15;
          } 
          else if (_offsetX >= 0.15) {
            _offsetX = 0.15;
          } else {
            _offsetX = 0;
          }
        });
      },
      child: Container(
        // color: Colors.yellow,
        child: FractionalTranslation(
          translation: Offset(_offsetX, 0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey[600]),
                  onPressed: () {
                    widget.edit();
                  },
                ),
                Favorite(),
                Expanded(
                  child: Container(child: Text(widget.title)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: IconButton(
                    icon: Icon(Icons.delete_forever, color: Colors.grey),
                    onPressed: () {
                      print('Delete ' + widget.title);
                      widget.delete();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool toggleFavorite = false;
  bool cutAnimation = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.0),
      child: IconButton(
        icon: FlareActor(
          'assets/flare/favorite.flr',
          animation: toggleFavorite ? 'Favorite' : 'Unfavorite',
          callback: (description) {
            print(description);
            print('Olá');
            cutAnimation = true;
          },
          snapToEnd: cutAnimation,
        ),
        color: Colors.red,
        onPressed: () {
          setState(() {
            cutAnimation = false;
            toggleFavorite = !toggleFavorite;
          });
        },
      ),
    );
  }
}
