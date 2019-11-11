import 'package:flutter/material.dart';

import './idea.dart';
import './add.dart';
import './menu.dart';

void main() {
  runApp(MaterialApp(
    title: 'Creativity',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, String> ideasMap = new Map();

  @override
  void initState() {
    print('Run MyAppState');
    super.initState();
  }

  int tabIndex = 1;

  @override
  Widget build(BuildContext context) {
    print('Build MainScreen');

    void _setTab(index) {
      setState(() {
        tabIndex = index;
      });
    }

    List<Widget> ideasWidget = [];
    ideasMap.forEach((key, value) {
      ideasWidget.add(Idea(
        title: key,
        delete: () {
          setState(() {
            ideasMap.remove(key);
          });
        },
        edit: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddIdea(
                      title: key,
                      description: value,
                    )),
          ).then((data) {
            if (data[0] != null && data[0] != '') {
              if (data[0] == key) {
                setState(() {
                  ideasMap.update(data[0], (value) => data[1]);
                });
              } else {
                setState(() {
                  ideasMap.remove(key);
                  ideasMap.putIfAbsent(data[0], () => data[1]);
                });
              }
            }
          });
        },
      ));
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Creativity'),
      ),
      body: ListView.builder(
        itemCount: ideasWidget.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ideasWidget[index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddIdea()),
          ).then((data) {
            if (data[0] != null && data[0] != '') {
              setState(() {
                ideasMap.putIfAbsent(data[0], () => data[1]);
              });
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_drama, color: Colors.blueGrey),
            title: new Text('Cloud', style: TextStyle(color: Colors.blueGrey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade, color: Colors.blueGrey),
            title: new Text('Rate', style: TextStyle(color: Colors.blueGrey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add, color: Colors.blueGrey),
            title: new Text('Invite', style: TextStyle(color: Colors.blueGrey)),
          ),
        ],
        onTap: (index) {
          _setTab(index);
        },
      ),
      drawer: Menu(),
    );
  }
}