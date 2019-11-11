// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AddIdea extends StatefulWidget {
  final String title;
  final String description;

  const AddIdea({Key key, this.title, this.description}) : super(key: key);
  @override
  _AddIdeaState createState() => _AddIdeaState();
}

class _AddIdeaState extends State<AddIdea> {
  final FocusNode nodeOne = FocusNode();
  final FocusNode nodeTwo = FocusNode();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Idea'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Add a title'),
              ),
              TextField(
                controller: titleController,
                autocorrect: true,
                maxLength: 50,
                textCapitalization: TextCapitalization.sentences,
                maxLengthEnforced: true,
                focusNode: nodeOne,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(nodeTwo);
                },
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text('Detail your idea'),
              ),
              TextField(
                controller: descriptionController,
                autocorrect: true,
                focusNode: nodeTwo,
                maxLines: 10,
                onSubmitted: (data) {
                  print(data);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [titleController.text, descriptionController.text]);
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
