import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Row(children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    ExactAssetImage('assets/images/billie-eilish.jpg'),
                minRadius: 20,
                maxRadius: 20,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/billie-eilish.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5, 5),
                      blurRadius: 4,
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'BILLIE EILISH',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  Text('SINGER'),
                ],
              ),
            ]),
          ),
          ListTile(
            title: Text('Account'),
            subtitle: Text('Perfil'),
            leading: Container(
                child: Icon(
              Icons.person,
              size: 42.0,
            )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Settings'),
            subtitle: Text('Configure'),
            leading: Container(
                child: Icon(
              Icons.settings,
              size: 42.0,
            )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Feedback'),
            subtitle: Text('Rate'),
            leading: Container(
                child: Icon(
              Icons.star,
              size: 42.0,
            )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
