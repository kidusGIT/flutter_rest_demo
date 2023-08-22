import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({super.key});

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  // ignore: prefer_typing_uninitialized_variables
  var data;

  final TextEditingController _noteTextController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)?.settings.arguments;
    fetchNotes(id);
  }

  fetchNotes(var id) async {
    if (id != 0) {
      var url = Uri.parse('${Config.url}/note-list/$id');
      var res = await http.get(url);
      data = jsonDecode(res.body);
      _noteTextController.text = data['notes'];
    }
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Text("Title"),
          leading: SizedBox(
            height: 20,
            width: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () async {
                if (id == 0 && _noteTextController.text != '') {
                  await addNote(_noteTextController.text);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  return;
                } else if (id != 0 && _noteTextController.text != '') {
                  await updateNote(_noteTextController.text, id);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  return;
                } else if (_noteTextController.text == '') {
                  await deleteNote(id);

                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  return;
                }
              },
              style: IconButton.styleFrom(backgroundColor: Colors.blueAccent),
            ),
          ),
          actions: <Widget>[
            id == 0
                ? Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                      ),
                      onPressed: () async {
                        await addNote(_noteTextController.text);
                        Navigator.pop(context);
                      },
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.blueAccent),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline_sharp,
                      ),
                      onPressed: () async {
                        await deleteNote(id);
                        Navigator.pop(context);
                      },
                    ),
                  )
          ]),
      body: TextField(
        controller: _noteTextController,
        keyboardType: TextInputType.multiline,
        textAlign: TextAlign.left,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            hintText: 'Write your note here',
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none),
        maxLines: null,
        minLines: null,
        expands: true,
      ),
    );
  }
}
